# frozen_string_literal: true

class AdvertisementsController < AuthenticatedController
  before_action :load_target, only: %i[subcategories category_settings cities]
  before_action :authenticate_user!, except: [:index]

  def index
    @pagy, @advertisements = pagy(Advertisement.all)
  end

  def new
    @advertisement = Advertisement.new
    authorize(@advertisement)
    @categories = Category.all
    @regions = Region.all
  end

  # rubocop:disable Metrics/AbcSize

  def create
    @advertisement = current_user.advertisements.build(advertisement_params)

    if Services::Advertisements::Create.call(@advertisement, params[:advertisement_additional]).success?
      flash[:notice] = 'Ваше объявление отправлено на модерацию!'
      redirect_to root_path
    else
      @categories, @regions = Category.all
      @regions = Region.all
      flash.now[:alert] = 'К сожалению что-то пошло не так'
      render 'new'
    end
  end

  # rubocop:enable Metrics/AbcSize

  def subcategories
    category = Category.find(params[:category])
    @subcategories = category.subcategories

    render_turbo
  end

  def category_settings
    subcategory = Subcategory.find(params[:subcategory])
    @category_settings = subcategory.category_settings.includes(:setting_values)

    render_turbo
  end

  def cities
    region = Region.find(params[:region])
    @cities = region.cities

    render_turbo
  end

  private

  def advertisement_params
    params.require(:advertisement).permit(:name, :subcategory_id, :description, :city_id,
                                          :customer_email, :customer_phone)
  end

  def load_target
    @target = params[:target]
  end

  def render_turbo
    respond_to do |format|
      format.turbo_stream
    end
  end
end
