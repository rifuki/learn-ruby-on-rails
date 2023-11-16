# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index' ## <- change root path (/) will be http://localhost/

  get '/home', to: 'home#index' ## <- will be http://localhost/home (rails v7 feature)
  get '/setting' => 'home#setting' ## <- alternate version using arrow instead of 'to:' keyword (rails v5 feature)
  get '/home/about'

  get '/article', to: 'article#index'
  get '/article/detail/:id', to: 'article#detail'
  get '/article/input', to: 'article#input'
  post '/article/create', to: 'article#create'

  get '/article/edit/:id', to: 'article#edit'
  put '/article/update/:id', to: 'article#update'
  get '/article/delete/:id', to: 'article#delete'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
