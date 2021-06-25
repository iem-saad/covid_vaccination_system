Rails.application.routes.draw do
  namespace :admin do
    resources :vaccination_centers
  end
  namespace :admin do
    resources :vaccines
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  root 'home#index'
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  namespace :admin do
    resources :dashboard
    end
  resources :dashboard, only: %i[index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
