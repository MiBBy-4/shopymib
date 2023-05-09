# frozen_string_literal: true

class User < ApplicationRecord
  has_many :advertisements, dependent: :delete_all

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login]

  # 25, 29, 33, 44
  # regex for belarusian phone numbers - \+375(25|29|33|44)\d{7}

  validates :phone_number, length: { is: 13 }, format: { with: /\+375(25|29|33|44)\d{7}/,
                                                         message: 'must be a valid Belarusian phone number' },
                           uniqueness: { message: 'phone number is already taken' }, allow_blank: true

  attr_writer :login

  def login
    @login || email || phone_number
  end

  def self.find_for_database_authentication(warden_condition)
    conditions = warden_condition.dup
    login = conditions.delete(:login)

    if login
      where(conditions.to_h).where(['lower(phone_number) = :value OR lower(email) = :value',
                                    { value: login.downcase }]).first
    elsif conditions.key?(:phone_number) || conditions.key?(:email)
      where(conditions.to_h).first
    end
  end
end
