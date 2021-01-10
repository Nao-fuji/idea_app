Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
  }
  root to: 'ideas#index'
  get 'ideas/search'
  resources :ideas,except: :index do
    collection do
      get 'search'
    end
    resources :idea_purchases, only:[:index,:create]
  end
  resources :users, only: :show
  resources :recruits do
    resources :tweets, only: [:new,:create, :edit, :update] do
      resources :tweet_purchases, only:[:index, :create]
    end
  end
  resources :tweets, only: :destroy
end
