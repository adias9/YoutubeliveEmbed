Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'embed/index'
  get 'embed/new_message'


  root 'embed#index'
end
