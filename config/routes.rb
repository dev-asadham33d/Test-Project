# frozen_string_literal: true

Rails.application.routes.draw do
  resources :employments
  resources :details
  root to: 'details#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
