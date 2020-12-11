Rails.application.routes.draw do
  devise_for :users
  root to: 'ideas#index'
  resources :ideas,except: :index
  resources :users, only: :show
  resources :recruits do
    resources :tweets, only: :create
  end
  resources :tweets, only: :destroy
end
