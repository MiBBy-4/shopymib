# frozen_string_literal: true

class AdvertisementPolicy < ApplicationPolicy
  def create?
    user.phone_number.present?
  end
end
