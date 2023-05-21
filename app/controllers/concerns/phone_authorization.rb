# frozen_string_literal: true

module PhoneAuthorization
  extend ActiveSupport::Concern

  included do
    include Pundit::Authorization

    rescue_from Pundit::NotAuthorizedError, with: :phone_not_set

    private

    def phone_not_set
      flash[:alert] = 'Прежде, чем выполнять данное действие - укажите Ваш телефон'
      redirect_to new_authenticated_path
    end
  end
end
