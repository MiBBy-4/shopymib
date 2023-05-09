# frozen_string_literal: true

module Services
  module AdministrationDivisions
    module Regions
      class Receive < Services::Base::Service
        ADMINISTRATION_DIVISIONS_JSON = 'https://raw.githubusercontent.com/YanMetelitsa/Belarusian-cities/main/cities.json'

        def call
          regions = build_regions

          success(regions)
        end

        private

        def build_regions
          response = load_divisions

          return unless response.status.success?

          JSON.parse(response).keys
        end

        def load_divisions
          HTTP.get(ADMINISTRATION_DIVISIONS_JSON, headers: { 'Content-Type' => 'application/json' })
        end
      end
    end
  end
end
