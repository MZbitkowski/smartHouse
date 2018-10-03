Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'dashboard#index', as: 'dashboard'
  get '/lights', to: 'lights#index', as: 'lights'
  get '/lights/:id', to: 'lights#show', as: 'lights_show'
end
