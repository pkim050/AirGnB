Rails.application.routes.draw do

  resources :gyms, only: [:index, :show] do
    resources :reservations, only: [:index, :new, :show]
  end

  resources :reservations, only: [:create, :delete, :edit, :new, :show, :update]
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
