# frozen_string_literal: true

module Services
  module Cars
    module Models
      class Receive < Base::Service
        MODELS_API_URL = 'https://car-api2.p.rapidapi.com/api/models'

        attr_reader :make

        def initialize(make)
          @make = make
        end

        def call
          models = build_models

          success(models)
        end

        private

        def build_models
          response = load_models

          return unless response.status.success?

          data = JSON.parse(response)['data']

          models = data.pluck('name')

          return if models.blank?

          models
        end

        def load_models
          params = {
            make:,
            year: 2020
          }

          headers = {
            'X-RapidAPI-Key' => ENV.fetch('X_RAPID_API_KEY', nil),
            'X-RapidAPI-Host' => ENV.fetch('X_RAPID_API_HOSY', nil)
          }

          HTTP.get(MODELS_API_URL, params:, headers:)
        end
      end
    end
  end
end
