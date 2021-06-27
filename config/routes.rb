Rails.application.routes.draw do
  resources :assigned_vaccs
  namespace :admin do
    resources :allocated_vaccs
  end
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
  namespace :head do
    resources :dashboard
    get '/get_pin', to: 'vaccinations#get_pin'
    post '/vaccinate', to: 'vaccinations#vaccinate'
  end
  resources :dashboard, only: %i[index]
  get '/vac_details', to: 'assigned_vaccs#view_vaccination_details'
  get '/about', to: 'home#about'
  get '/contact', to: 'home#contact'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
