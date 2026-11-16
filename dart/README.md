# Travel Entry Requirements API - Dart/Flutter Client

Travel Entry Requirements returns what a destination asks of a visitor's passport and health documents: how long the passport must stay valid and from when, and whether a yellow fever certificate is required. Paid plans add a passport check against your trip dates, the blank pages it needs, the Schengen 10-year issue rule, the current UK and US travel advisory levels and plain-English guidance for each rule.

[![pub package](https://img.shields.io/pub/v/apiverve_entryrequirements.svg)](https://pub.dev/packages/apiverve_entryrequirements)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Travel Entry Requirements API](https://apiverve.com/marketplace/entryrequirements?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_entryrequirements: ^1.2.6
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_entryrequirements/apiverve_entryrequirements.dart';

void main() async {
  final client = EntryrequirementsClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'destination': 'TH',
      'arrivalDate': '2027-03-01',
      'departureDate': '2027-03-15',
      'passportExpiry': '2027-07-01'
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "destination": "TH",
    "destinationName": "Thailand",
    "passportValidity": {
      "rule": "months_after_arrival",
      "months": 6,
      "days": null,
      "summary": "Valid for at least 6 months after arrival",
      "issuedWithinYears": null,
      "guidance": "Your passport must be valid for at least 6 months after the day you arrive. It needs at least 1 blank page."
    },
    "blankPagesRequired": 1,
    "passportCheck": null,
    "yellowFever": {
      "certificate": "from_risk_countries",
      "certificateLabel": "Certificate required only when arriving from, or transiting, a country with yellow fever risk",
      "guidance": "A yellow fever vaccination certificate is required only if you are arriving from, or have transited through, a country with a risk of yellow fever transmission. Travelers coming directly from elsewhere do not need one."
    },
    "advisories": {
      "uk": {
        "level": "avoid_all_but_essential_travel_to_parts",
        "label": "Advises against all but essential travel to parts of the country",
        "url": "https://www.gov.uk/foreign-travel-advice/thailand"
      },
      "us": {
        "level": 1,
        "label": "Exercise normal precautions",
        "url": "https://travel.state.gov/content/tsg_aem/us/en/home/international-travel/travel-advisories/destination.tha.html"
      }
    },
    "rulesUpdatedAt": "2026-10-12T10:20:34+01:00",
    "updatedAt": "2026-11-14T08:32:16.103Z"
  }
}
```

## API Reference

- **API Home:** [Travel Entry Requirements API](https://apiverve.com/marketplace/entryrequirements?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/entryrequirements](https://docs.apiverve.com/ref/entryrequirements?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)
