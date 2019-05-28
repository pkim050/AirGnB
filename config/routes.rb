Rails.application.routes.draw do
  resources :gyms, only: [:show, :index] do
    resources :reservations, only: %i[new show index]
  end

  resources :reservations
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
