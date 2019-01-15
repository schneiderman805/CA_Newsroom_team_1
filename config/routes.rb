Rails.application.routes.draw do

  devise_for :users
  root controller: :articles, action: :index

  resources :articles, only: [:index, :show] do
    resources :comments, only: [:create, :update]
  end

  namespace :cms do
    resources :articles, only: [:index, :new, :create]
  end

end
