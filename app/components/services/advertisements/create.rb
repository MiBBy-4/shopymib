# frozen_string_literal: true

module Services
  module Advertisements
    class Create < Base::Service
      attr_reader :advertisement, :additional_params

      def initialize(advertisement, additional_params)
        @advertisement = advertisement
        @additional_params = additional_params
      end

      def call
        if advertisement.save
          complete_advertisement
          success(advertisement)
        else
          fail!(advertisement.errors.full_messages)
        end
      end

      private

      def complete_advertisement
        additional_params.each do |name, value|
          AdvertisementParam.create(name:, value:, advertisement:) if value.present?
        end
      end
    end
  end
end
