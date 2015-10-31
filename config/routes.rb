Rails.application.routes.draw do
  devise_for :users
  devise_scope(:user) { get 'logout', to: 'devise/sessions#destroy' }
  use_doorkeeper
  root to: 'home#index'
end
