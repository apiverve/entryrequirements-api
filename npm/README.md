# Travel Entry Requirements API

Travel Entry Requirements returns what a destination asks of a visitor's passport and health documents: how long the passport must stay valid and from when, and whether a yellow fever certificate is required. Paid plans add a passport check against your trip dates, the blank pages it needs, the Schengen 10-year issue rule, the current UK and US travel advisory levels and plain-English guidance for each rule.

[![npm version](https://img.shields.io/npm/v/@apiverve/entryrequirements.svg)](https://www.npmjs.com/package/@apiverve/entryrequirements)

This is a JavaScript wrapper for the [Travel Entry Requirements API](https://apiverve.com/marketplace/entryrequirements?utm_source=npm&utm_medium=referral&utm_content=readme)

---

## Installation

Using npm:
```shell
npm install @apiverve/entryrequirements
```

Using yarn:
```shell
yarn add @apiverve/entryrequirements
```

---

## Configuration

Before using the Travel Entry Requirements API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=npm&utm_medium=referral&utm_content=readme)

---

## Quick Start

[Get started with the Quick Start Guide](https://docs.apiverve.com/quickstart?utm_source=npm&utm_medium=referral&utm_content=readme)

The Travel Entry Requirements API documentation is found here: [https://docs.apiverve.com/ref/entryrequirements](https://docs.apiverve.com/ref/entryrequirements?utm_source=npm&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```javascript
const entryrequirementsAPI = require('@apiverve/entryrequirements');
const api = new entryrequirementsAPI({
    api_key: '[YOUR_API_KEY]'
});
```

---

## Usage

---

### Perform Request

Using the API is simple. All you have to do is make a request. The API will return a response with the data you requested.

```javascript
var query = {
  destination: "TH",
  arrivalDate: "2027-03-01",
  departureDate: "2027-03-15",
  passportExpiry: "2027-07-01"
};

api.execute(query, function (error, data) {
    if (error) {
        return console.error(error);
    } else {
        console.log(data);
    }
});
```

---

### Using Promises

You can also use promises to make requests. The API returns a promise that you can use to handle the response.

```javascript
var query = {
  destination: "TH",
  arrivalDate: "2027-03-01",
  departureDate: "2027-03-15",
  passportExpiry: "2027-07-01"
};

api.execute(query)
    .then(data => {
        console.log(data);
    })
    .catch(error => {
        console.error(error);
    });
```

---

### Using Async/Await

You can also use async/await to make requests. The API returns a promise that you can use to handle the response.

```javascript
async function makeRequest() {
    var query = {
  destination: "TH",
  arrivalDate: "2027-03-01",
  departureDate: "2027-03-15",
  passportExpiry: "2027-07-01"
};

    try {
        const data = await api.execute(query);
        console.log(data);
    } catch (error) {
        console.error(error);
    }
}
```

---

## Example Response

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

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=npm&utm_medium=referral&utm_content=readme).

---

## Updates

Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=npm&utm_medium=referral&utm_content=readme) and [Privacy Policy](https://apiverve.com/privacy?utm_source=npm&utm_medium=referral&utm_content=readme).

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
