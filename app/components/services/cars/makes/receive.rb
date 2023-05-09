# frozen_string_literal: true

module Services
  module Cars
    module Makes
      class Receive < Base::Service
        CARS_API_URL = 'https://car-data.p.rapidapi.com/cars/makes'

        def call
          brands = build_brands

          success(brands)
        end

        private

        def build_brands
          response = load_brands

          return unless response.status.success?

          brands = JSON.parse(response)

          return if brands.blank?

          brands
        end

        def load_brands
          headers = {
            'X-RapidAPI-Key' => ENV.fetch('X_RAPID_API_KEY', nil),
            'X-RapidAPI-Host' => ENV.fetch('X_RAPID_API_HOSY', nil)
          }

          HTTP.get(CARS_API_URL, headers:)
        end
      end
    end
  end
end
