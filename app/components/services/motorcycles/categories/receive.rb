# frozen_string_literal: true

module Services
  module Motorcycles
    module Categories
      class Receive < Base::Service
        MOTORCYCLES_API_URL = 'https://motorcycle-specs-database.p.rapidapi.com/category'

        def call
          categories = build_categories

          success(categories)
        end

        private

        def build_categories
          response = load_categories

          return unless response.status.success?

          data = JSON.parse(response)

          categories = data.pluck('name')

          return if categories.blank?

          categories
        end

        def load_categories
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
