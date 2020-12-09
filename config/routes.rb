Rails.application.routes.draw do
  devise_for :users
  root to: 'ideas#index'
  resources :ideas,except: :index
  resources :recruits do
    resources :tweets, only: :create
  end
end
