Rails.application.routes.draw do

  resources :gyms do
    resources :reservations
  end

  resources :user do
    resources :reservations
  end

  get 'search', to: 'gyms#search', as: 'search'

  get 'host_gym', to: 'gyms#host_gym'
  get 'host_gyms', to: 'gyms#host_gyms'

  resources :reservations, only: [:create, :delete, :edit, :new, :show, :update, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to:"application#home"

  devise_for :users, :controllers => {:registrations => "registrations", omniauth_callbacks:"callbacks"}
    devise_scope :user do
      get 'login', to: 'devise/sessions#new'
    end
    devise_scope :user do
      get 'signup', to: 'devise/registrations#new'
    end
end
