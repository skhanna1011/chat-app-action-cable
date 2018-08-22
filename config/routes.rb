Rails.application.routes.draw do
  get 'home/index'

  devise_for :users
  
  root "home#index"
  resources :chatrooms, param: :slug
  resources :messages

  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end