Rails.application.routes.draw do

  root 'hello#index'

  get '/home/index', to: 'home#index'

  resources :yearly_usages
end
