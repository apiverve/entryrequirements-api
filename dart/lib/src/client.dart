import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models.dart';

/// Validation rule for a parameter.
class ValidationRule {
  final String type;
  final bool required;
  final num? min;
  final num? max;
  final int? minLength;
  final int? maxLength;
  final String? format;
  final List<String>? enumValues;

  const ValidationRule({
    required this.type,
    required this.required,
    this.min,
    this.max,
    this.minLength,
    this.maxLength,
    this.format,
    this.enumValues,
  });
}

/// Exception thrown when parameter validation fails.
class EntryrequirementsValidationException implements Exception {
  final List<String> errors;

  EntryrequirementsValidationException(this.errors);

  @override
  String toString() => 'EntryrequirementsValidationException: ${errors.join("; ")}';
}

/// Format validation patterns.
final _formatPatterns = {
  'email': RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$'),
  'url': RegExp(r'^https?://.+'),
  'ip': RegExp(r'^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$|^([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}$'),
  'date': RegExp(r'^\d{4}-\d{2}-\d{2}$'),
  'hexColor': RegExp(r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$'),
};

/// Travel Entry Requirements API client.
///
/// For more information, visit: https://apiverve.com/marketplace/entryrequirements?utm_source=dart&utm_medium=referral&utm_content=readme
///
/// Parameters:
/// * [destination] (required) - The destination country or territory: a two-letter ISO code such as TH, or an English name such as Thailand [maxLength: 60]
/// * [arrivalDate] - Trip arrival date (YYYY-MM-DD), for passportCheck [format: date]
/// * [departureDate] - Trip departure date (YYYY-MM-DD), for passportCheck [format: date]
/// * [passportExpiry] - The traveler's passport expiry date (YYYY-MM-DD); passportCheck says whether it meets the destination's rule [format: date]
class EntryrequirementsClient {
  final String apiKey;
  final String baseUrl;
  final http.Client _httpClient;

  /// Validation rules for parameters.
  static final Map<String, ValidationRule> _validationRules = <String, ValidationRule>{
    'destination': ValidationRule(type: 'string', required: true, maxLength: 60),
    'arrivalDate': ValidationRule(type: 'string', required: false, format: 'date'),
    'departureDate': ValidationRule(type: 'string', required: false, format: 'date'),
    'passportExpiry': ValidationRule(type: 'string', required: false, format: 'date'),
  };

  EntryrequirementsClient(this.apiKey, {
    this.baseUrl = 'https://api.apiverve.com/v1/entryrequirements',
    http.Client? httpClient,
  }) : _httpClient = httpClient ?? http.Client();

  /// Validates parameters against defined rules.
  /// Throws [EntryrequirementsValidationException] if validation fails.
  void _validateParams(Map<String, dynamic> params) {
    final errors = <String>[];

    for (final entry in _validationRules.entries) {
      final paramName = entry.key;
      final rule = entry.value;
      final value = params[paramName];

      // Check required
      if (rule.required && (value == null || (value is String && value.isEmpty))) {
        errors.add('Required parameter [$paramName] is missing');
        continue;
      }

      if (value == null) continue;

      // Type-specific validation
      if (rule.type == 'integer' || rule.type == 'number') {
        final numValue = value is num ? value : num.tryParse(value.toString());
        if (numValue == null) {
          errors.add('Parameter [$paramName] must be a valid ${rule.type}');
          continue;
        }
        if (rule.min != null && numValue < rule.min!) {
          errors.add('Parameter [$paramName] must be at least ${rule.min}');
        }
        if (rule.max != null && numValue > rule.max!) {
          errors.add('Parameter [$paramName] must be at most ${rule.max}');
        }
      } else if (rule.type == 'string' && value is String) {
        if (rule.minLength != null && value.length < rule.minLength!) {
          errors.add('Parameter [$paramName] must be at least ${rule.minLength} characters');
        }
        if (rule.maxLength != null && value.length > rule.maxLength!) {
          errors.add('Parameter [$paramName] must be at most ${rule.maxLength} characters');
        }
        if (rule.format != null && _formatPatterns.containsKey(rule.format)) {
          if (!_formatPatterns[rule.format]!.hasMatch(value)) {
            errors.add('Parameter [$paramName] must be a valid ${rule.format}');
          }
        }
      }

      // Enum validation
      if (rule.enumValues != null && rule.enumValues!.isNotEmpty) {
        if (!rule.enumValues!.contains(value.toString())) {
          errors.add('Parameter [$paramName] must be one of: ${rule.enumValues!.join(", ")}');
        }
      }
    }

    if (errors.isNotEmpty) {
      throw EntryrequirementsValidationException(errors);
    }
  }

  /// Execute a request to the Travel Entry Requirements API.
  ///
  /// Parameters are validated before sending the request.
  Future<EntryrequirementsResponse> execute(Map<String, dynamic> params) async {
    // Validate parameters
    _validateParams(params);
    if (apiKey.isEmpty) {
      throw EntryrequirementsException('API key is required. Get your API key at: https://apiverve.com');
    }

    try {
      final uri = Uri.parse(baseUrl).replace(
        queryParameters: params.map((key, value) => MapEntry(key, value.toString())),
      );

      final response = await _httpClient.get(
        uri,
        headers: {
          'x-api-key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        return EntryrequirementsResponse.fromJson(json);
      } else if (response.statusCode == 401) {
        throw EntryrequirementsException('Invalid API key');
      } else if (response.statusCode == 404) {
        throw EntryrequirementsException('Resource not found');
      } else {
        throw EntryrequirementsException('API error: ${response.statusCode}');
      }
    } catch (e) {
      if (e is EntryrequirementsException) rethrow;
      throw EntryrequirementsException('Request failed: $e');
    }
  }


  /// Close the HTTP client.
  void close() {
    _httpClient.close();
  }
}

/// Exception thrown by the Travel Entry Requirements API client.
class EntryrequirementsException implements Exception {
  final String message;

  EntryrequirementsException(this.message);

  @override
  String toString() => 'EntryrequirementsException: $message';
}
