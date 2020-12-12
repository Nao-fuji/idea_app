Rails.application.routes.draw do
  devise_for :users
  root to: 'ideas#index'
  resources :ideas,except: :index do
    resources :idea_purchases, only:[:index,:create]
  end
  resources :users, only: :show
  resources :recruits do
    resources :tweets, only: :create do
      resources :tweet_purchases, only:[:index, :create]
    end
  end
  resources :tweets, only: :destroy
end
