Rails.application.routes.draw do
  root 'pins#index'

  devise_for :users

  resources :pins, only: [:index, :new, :create]  
end
