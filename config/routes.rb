Rails.application.routes.draw do
  devise_for :users
  root to: 'ideas#index'
  resources :ideas,except: :index
  resources :recruits,except: :index
end
