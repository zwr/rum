Rails.application.routes.draw do
  resources :organizations
  namespace :api, defaults: { format: 'json' } do
    get 'user/info'
  end

  devise_for :users
  devise_scope(:user) { get 'logout', to: 'devise/sessions#destroy' }
  use_doorkeeper
  root to: 'home#index'
end
