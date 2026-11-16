/// Response models for the Travel Entry Requirements API.

/// API Response wrapper.
class EntryrequirementsResponse {
  final String status;
  final dynamic error;
  final EntryrequirementsData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  EntryrequirementsResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory EntryrequirementsResponse.fromJson(Map<String, dynamic> json) => EntryrequirementsResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? EntryrequirementsData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Travel Entry Requirements API.

class EntryrequirementsData {
  String? destination;
  String? destinationName;
  EntryrequirementsDataPassportvalidity? passportValidity;
  num? blankPagesRequired;
  dynamic passportCheck;
  EntryrequirementsDataYellowfever? yellowFever;
  EntryrequirementsDataAdvisories? advisories;
  String? rulesUpdatedAt;
  String? updatedAt;

  EntryrequirementsData({
    this.destination,
    this.destinationName,
    this.passportValidity,
    this.blankPagesRequired,
    this.passportCheck,
    this.yellowFever,
    this.advisories,
    this.rulesUpdatedAt,
    this.updatedAt,
  });

  factory EntryrequirementsData.fromJson(Map<String, dynamic> json) => EntryrequirementsData(
      destination: json['destination'],
      destinationName: json['destinationName'],
      passportValidity: json['passportValidity'] != null ? EntryrequirementsDataPassportvalidity.fromJson(json['passportValidity']) : null,
      blankPagesRequired: json['blankPagesRequired'],
      passportCheck: json['passportCheck'],
      yellowFever: json['yellowFever'] != null ? EntryrequirementsDataYellowfever.fromJson(json['yellowFever']) : null,
      advisories: json['advisories'] != null ? EntryrequirementsDataAdvisories.fromJson(json['advisories']) : null,
      rulesUpdatedAt: json['rulesUpdatedAt'],
      updatedAt: json['updatedAt'],
    );
}

class EntryrequirementsDataPassportvalidity {
  String? rule;
  num? months;
  dynamic days;
  String? summary;
  dynamic issuedWithinYears;
  String? guidance;

  EntryrequirementsDataPassportvalidity({
    this.rule,
    this.months,
    this.days,
    this.summary,
    this.issuedWithinYears,
    this.guidance,
  });

  factory EntryrequirementsDataPassportvalidity.fromJson(Map<String, dynamic> json) => EntryrequirementsDataPassportvalidity(
      rule: json['rule'],
      months: json['months'],
      days: json['days'],
      summary: json['summary'],
      issuedWithinYears: json['issuedWithinYears'],
      guidance: json['guidance'],
    );
}

class EntryrequirementsDataYellowfever {
  String? certificate;
  String? certificateLabel;
  String? guidance;

  EntryrequirementsDataYellowfever({
    this.certificate,
    this.certificateLabel,
    this.guidance,
  });

  factory EntryrequirementsDataYellowfever.fromJson(Map<String, dynamic> json) => EntryrequirementsDataYellowfever(
      certificate: json['certificate'],
      certificateLabel: json['certificateLabel'],
      guidance: json['guidance'],
    );
}

class EntryrequirementsDataAdvisories {
  EntryrequirementsDataAdvisoriesUk? uk;
  EntryrequirementsDataAdvisoriesUs? us;

  EntryrequirementsDataAdvisories({
    this.uk,
    this.us,
  });

  factory EntryrequirementsDataAdvisories.fromJson(Map<String, dynamic> json) => EntryrequirementsDataAdvisories(
      uk: json['uk'] != null ? EntryrequirementsDataAdvisoriesUk.fromJson(json['uk']) : null,
      us: json['us'] != null ? EntryrequirementsDataAdvisoriesUs.fromJson(json['us']) : null,
    );
}

class EntryrequirementsDataAdvisoriesUk {
  String? level;
  String? label;
  String? url;

  EntryrequirementsDataAdvisoriesUk({
    this.level,
    this.label,
    this.url,
  });

  factory EntryrequirementsDataAdvisoriesUk.fromJson(Map<String, dynamic> json) => EntryrequirementsDataAdvisoriesUk(
      level: json['level'],
      label: json['label'],
      url: json['url'],
    );
}

class EntryrequirementsDataAdvisoriesUs {
  num? level;
  String? label;
  String? url;

  EntryrequirementsDataAdvisoriesUs({
    this.level,
    this.label,
    this.url,
  });

  factory EntryrequirementsDataAdvisoriesUs.fromJson(Map<String, dynamic> json) => EntryrequirementsDataAdvisoriesUs(
      level: json['level'],
      label: json['label'],
      url: json['url'],
    );
}

class EntryrequirementsRequest {
  String destination;
  String? arrivalDate;
  String? departureDate;
  String? passportExpiry;

  EntryrequirementsRequest({
    required this.destination,
    this.arrivalDate,
    this.departureDate,
    this.passportExpiry,
  });

  Map<String, dynamic> toJson() => {
      'destination': destination,
      if (arrivalDate != null) 'arrivalDate': arrivalDate,
      if (departureDate != null) 'departureDate': departureDate,
      if (passportExpiry != null) 'passportExpiry': passportExpiry,
    };
}
