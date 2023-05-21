# frozen_string_literal: true

class AuthenticatedController < ApplicationController
  include PhoneAuthorization

  before_action :authenticate_user!
  before_action :load_user, only: %i[new create]

  def new
    redirect_to root_path if current_user.phone_number.present?
  end

  def create
    if @user.update(user_params)
      redirect_back_or_to root_path
    else
      flash[:alert] = 'Что-то пошло не так'
      render 'new'
    end
  end

  private

  def user_params
    params.permit(:phone_number)
  end

  def load_user
    @user = current_user
  end
end
