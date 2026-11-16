# Travel Entry Requirements API - Ruby Gem

Travel Entry Requirements returns what a destination asks of a visitor's passport and health documents: how long the passport must stay valid and from when, and whether a yellow fever certificate is required. Paid plans add a passport check against your trip dates, the blank pages it needs, the Schengen 10-year issue rule, the current UK and US travel advisory levels and plain-English guidance for each rule.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_entryrequirements'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_entryrequirements
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_entryrequirements'

# Initialize the client
client = APIVerve::Entryrequirements::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({
  destination: "TH",
  arrivalDate: "2027-03-01",
  departureDate: "2027-03-15",
  passportExpiry: "2027-07-01"
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ destination: "TH", arrivalDate: "2027-03-01", departureDate: "2027-03-15", passportExpiry: "2027-07-01" })
  puts response["data"]
rescue APIVerve::Entryrequirements::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Entryrequirements::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Entryrequirements::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
```

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

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/entryrequirements?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/entryrequirements?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/entryrequirements?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
