# frozen_string_literal: true

module Services
  module Motorcycles
    module Makes
      class Receive < Base::Service
        MOTORCYCLES_API_URL = 'https://motorcycle-specs-database.p.rapidapi.com/make'

        def call
          brands = build_brands

          success(brands)
        end

        private

        def build_brands
          response = load_brands

          return unless response.status.success?

          data = JSON.parse(response)

          brands = data.pluck('name')

          return if brands.blank?

          brands
        end

        def load_brands
          headers = {
            'X-RapidAPI-Key' => ENV.fetch('X_RAPID_API_MOTORCYCLES_KEY', nil),
            'X-RapidAPI-Host' => ENV.fetch('X_RAPID_API_MOTORCYCLES_HOST', nil)
          }

          HTTP.get(MOTORCYCLES_API_URL, headers:)
        end
      end
    end
  end
end
