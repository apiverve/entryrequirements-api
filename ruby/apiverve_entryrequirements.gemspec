# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "apiverve_entryrequirements"
  spec.version       = "1.2.6"
  spec.authors       = ["APIVerve"]
  spec.email         = ["hello@apiverve.com"]

  spec.summary       = "Travel Entry Requirements API - Ruby Client"
  spec.description   = "Travel Entry Requirements returns what a destination asks of a visitor's passport and health documents: how long the passport must stay valid and from when, and whether a yellow fever certificate is required. Paid plans add a passport check against your trip dates, the blank pages it needs, the Schengen 10-year issue rule, the current UK and US travel advisory levels and plain-English guidance for each rule."
  spec.homepage      = "https://apiverve.com/marketplace/entryrequirements?utm_source=ruby&utm_medium=referral&utm_content=homepage"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/apiverve/entryrequirements-API/tree/main/ruby"
  spec.metadata["changelog_uri"] = "https://apiverve.com/changelog"
  spec.metadata["documentation_uri"] = "https://docs.apiverve.com/ref/entryrequirements"

  spec.files = Dir.glob("{lib}/**/*") + %w[README.md LICENSE]
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", ">= 1.0", "< 3.0"
  spec.add_dependency "faraday-multipart", "~> 1.0"
  spec.add_dependency "json", "~> 2.0"
end
