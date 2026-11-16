# [Travel Entry Requirements API](https://apiverve.com/marketplace/entryrequirements?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)

Travel Entry Requirements returns what a destination asks of a visitor&#x27;s passport and health documents: how long the passport must stay valid and from when, and whether a yellow fever certificate is required. Paid plans add a passport check against your trip dates, the blank pages it needs, the Schengen 10-year issue rule, the current UK and US travel advisory levels and plain-English guidance for each rule.

The Travel Entry Requirements API provides a simple, reliable way to integrate travel entry requirements functionality into your applications. Built for developers who need production-ready travel entry requirements capabilities without the complexity of building from scratch.

**[View API Details →](https://apiverve.com/marketplace/entryrequirements?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![API Status](https://img.shields.io/badge/Status-Active-green.svg)](https://apiverve.com/marketplace/entryrequirements?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)
[![Method](https://img.shields.io/badge/Method-GET-blue.svg)](#)
[![Platform](https://img.shields.io/badge/Platform-Multi--Platform-orange.svg)](#installation)

**Available on:**
[![npm](https://img.shields.io/badge/npm-CB3837?style=flat&logo=npm&logoColor=white)](https://www.npmjs.com/package/@apiverve/entryrequirements)
[![NuGet](https://img.shields.io/badge/NuGet-004880?style=flat&logo=nuget&logoColor=white)](https://www.nuget.org/packages/APIVerve.API.TravelEntryRequirements)
[![PyPI](https://img.shields.io/badge/PyPI-3776AB?style=flat&logo=python&logoColor=white)](https://pypi.org/project/apiverve-entryrequirements/)
[![RubyGems](https://img.shields.io/badge/RubyGems-E9573F?style=flat&logo=rubygems&logoColor=white)](https://rubygems.org/gems/apiverve_entryrequirements)
[![Packagist](https://img.shields.io/badge/Packagist-F28D1A?style=flat&logo=packagist&logoColor=white)](https://packagist.org/packages/apiverve/entryrequirements)
[![Go](https://img.shields.io/badge/Go-00ADD8?style=flat&logo=go&logoColor=white)](#-go)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=flat&logo=dart&logoColor=white)](https://pub.dev/packages/apiverve_entryrequirements)
[![JitPack](https://img.shields.io/badge/JitPack-2E7D32?style=flat&logo=android&logoColor=white)](#-android-jitpack)

---

## Quick Start

### Using JavaScript

```javascript
async function callTravelEntryRequirementsAPI() {
    try {
        const params = new URLSearchParams({
            destination: 'TH'
        });

        const response = await fetch(`https://api.apiverve.com/v1/entryrequirements?${params}`, {
            method: 'GET',
            headers: {
                'x-api-key': 'YOUR_API_KEY_HERE'
            }
        });

        const data = await response.json();
        console.log(data);
    } catch (error) {
        console.error('Error:', error);
    }
}

callTravelEntryRequirementsAPI();
```

### Using cURL

```bash
curl -X GET "https://api.apiverve.com/v1/entryrequirements?destination=TH" \
  -H "x-api-key: YOUR_API_KEY_HERE"
```

**Get your API key:** [https://apiverve.com](https://apiverve.com)

**📁 For more examples, see the [examples folder](./examples/)**

---

## Installation

Choose your preferred programming language:

### 📦 NPM (JavaScript/Node.js)

```bash
npm install @apiverve/entryrequirements
```

[**View NPM Package →**](https://www.npmjs.com/package/@apiverve/entryrequirements) | [**Package Code →**](./npm/)

---

### 🔷 NuGet (.NET/C#)

```bash
dotnet add package APIVerve.API.TravelEntryRequirements
```

[**View NuGet Package →**](https://www.nuget.org/packages/APIVerve.API.TravelEntryRequirements) | [**Package Code →**](./nuget/)

---

### 🐍 Python (PyPI)

```bash
pip install apiverve-entryrequirements
```

[**View PyPI Package →**](https://pypi.org/project/apiverve-entryrequirements/) | [**Package Code →**](./python/)

---

### 💎 Ruby (RubyGems)

```bash
gem install apiverve_entryrequirements
```

[**View RubyGems Package →**](https://rubygems.org/gems/apiverve_entryrequirements) | [**Package Code →**](./ruby/)

---

### 🐘 PHP (Packagist)

```bash
composer require apiverve/entryrequirements
```

[**View Packagist Package →**](https://packagist.org/packages/apiverve/entryrequirements) | [**Package Code →**](./php/)

---

### 🎯 Dart (pub.dev)

```bash
dart pub add apiverve_entryrequirements
```

[**View pub.dev Package →**](https://pub.dev/packages/apiverve_entryrequirements) | [**Package Code →**](./dart/)

---

### 🤖 Android (JitPack)

```gradle
implementation 'com.github.apiverve:entryrequirements-api:1.0.0'
```

[**Package Code →**](./android/)

---

### 🐹 Go

```bash
go get github.com/apiverve/entryrequirements-api/go
```

[**Package Code →**](./go/)

---

## Why Use This API?

| Feature | Benefit |
|---------|---------|
| **Multi-language SDKs** | Native packages for JavaScript, Python, C#, Go, and Android |
| **Simple Integration** | Single API key authentication, consistent response format |
| **Production Ready** | 99.9% uptime SLA, served from 24 global regions |
| **Comprehensive Docs** | Full examples, OpenAPI spec, and dedicated support |

---

## Documentation

- 🏠 **API Home:** [Travel Entry Requirements API](https://apiverve.com/marketplace/entryrequirements?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)
- 📚 **API Reference:** [docs.apiverve.com/ref/entryrequirements](https://docs.apiverve.com/ref/entryrequirements)
- 📖 **OpenAPI Spec:** [openapi.yaml](./openapi.yaml)
- 💡 **Examples:** [examples/](./examples/)

---

## What Can You Build?

The Travel Entry Requirements API is commonly used for:

- **Web Applications** - Add travel entry requirements features to your frontend or backend
- **Mobile Apps** - Native SDKs for Android development
- **Automation** - Integrate with n8n, Zapier, or custom workflows
- **SaaS Products** - Enhance your product with travel entry requirements capabilities
- **Data Pipelines** - Process and analyze data at scale

---

## API Reference

### Authentication
All requests require an API key in the header:
```
x-api-key: YOUR_API_KEY_HERE
```

Get your API key: [https://apiverve.com](https://apiverve.com)

### Response Format

Every APIVerve endpoint returns the same envelope — check `status`, then read `data`:

```json
{
  "status": "ok",
  "error": null,
  "data": { ... }
}
```

### Example Response

A real response from the Travel Entry Requirements API:

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

---

## Support & Community

- 🏠 **API Home**: [Travel Entry Requirements API](https://apiverve.com/marketplace/entryrequirements?utm_source&#x3D;github&amp;utm_medium&#x3D;referral&amp;utm_content&#x3D;readme)
- 💬 **Support**: [https://apiverve.com/contact](https://apiverve.com/contact)
- 🐛 **Issues**: [GitHub Issues](../../issues)
- 📖 **Documentation**: [https://docs.apiverve.com](https://docs.apiverve.com)
- 🌐 **Website**: [https://apiverve.com](https://apiverve.com)

---

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

---

## Security

For security concerns, please review our [Security Policy](SECURITY.md).

---

## License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

## Acknowledgments

Built with ❤️ by [APIVerve](https://apiverve.com)

Copyright © 2026 APIVerve. All rights reserved.
