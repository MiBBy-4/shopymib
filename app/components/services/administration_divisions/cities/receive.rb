# frozen_string_literal: true

module Services
  module AdministrationDivisions
    module Cities
      class Receive < Services::Base::Service
        ADMINISTRATION_DIVISIONS_JSON = 'https://raw.githubusercontent.com/YanMetelitsa/Belarusian-cities/main/cities.json'

        attr_reader :region

        def initialize(region)
          @region = region
          @cities = []
        end

        def call
          build_cities

          success(@cities.flatten.sort)
        end

        private

        attr_accessor :cities

        def build_cities
          response = load_divisions

          return unless response.status.success?

          districts = JSON.parse(response)[region]

          districts.map do |district, cities|
            @cities << if cities.empty?
                         district
                       else
                         cities.keys
                       end
          end
        end

        def load_divisions
          HTTP.get(ADMINISTRATION_DIVISIONS_JSON, headers: { 'Content-Type' => 'application/json' })
        end
      end
    end
  end
end
