Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'dashboard#index', as: 'dashboard'
  get '/lights', to: 'lights#index', as: 'lights'
  get '/lights/on', to: 'lights#on', as: 'lights_on', defaults: {format: 'json'}
  get '/lights/off', to: 'lights#off', as: 'lights_off', defaults: {format: 'json'}
  get '/lights/listen', to: 'lights#listen', as: 'lights_listen'
  get '/lights/:id', to: 'lights#show', as: 'lights_show'
end
