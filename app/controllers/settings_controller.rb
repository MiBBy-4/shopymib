# frozen_string_literal: true

class SettingsController < AuthenticatedController
  before_action :authenticate_user!
  before_action :load_user, only: %i[personal_info contact_info update_personal_info update_contact_info]

  def contact_info
    @regions = Region.all
  end

  def personal_info; end

  def update_personal_info
    if @user.update(personal_params)
      flash[:notice] = 'Настройки изменены!'
      redirect_to account_personal_info_path
    else
      flash.now[:alert] = 'Что-то пошло не так'
      render 'personal_info', status: :unprocessable_entity
    end
  end

  def update_contact_info
    if @user.update(contact_params)
      flash[:notice] = 'Настройки изменены!'
      redirect_to account_contact_info_path
    else
      flash.now[:alert] = 'Что-то пошло не так'
      render 'contact_info', status: :unprocessable_entity
    end
  end

  private

  def contact_params
    params.require(:user).permit(:city_id)
  end

  def personal_params
    params.require(:user).permit(:phone_number, :name, :birth_date, :sex)
  end

  def load_user
    @user = current_user
  end
end
