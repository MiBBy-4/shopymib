# frozen_string_literal: true

require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/cassettes'

  config.default_cassette_options = { match_requests_on: %i[host path method] }

  config.hook_into :webmock

  # config.filter_sensitive_data('<API_TOKEN>') do |interaction|
  #   interaction.request.parsed_uri.query.split('&').first.split('=').second
  # end
end
