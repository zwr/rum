Rails.application.routes.draw do
  resources :organizations
  namespace :api, defaults: { format: 'json' } do
    get 'user/info'
    post 'user/logout'
  end

  devise_for :users
  devise_scope(:user) { get 'users/logout', to: 'devise/sessions#destroy' }
  use_doorkeeper
  root to: 'home#index'
end
