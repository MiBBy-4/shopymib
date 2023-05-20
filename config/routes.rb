# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations" }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "advertisements#index"

  resources :advertisements, only: [:index, :new, :create] do
    collection do
      get :subcategories
      get :category_settings
      get :cities
    end
  end

  resources :authenticated, only: [:new, :create]
end
