Rails.application.routes.draw do

  devise_for :users
  root controller: :articles, action: :index

  resources :articles, only: [:index, :show]

  resources :categories, only: [:show]

  namespace :cms do
    resources :articles
    resources :transactions, only: [:new, :create]
  end

end