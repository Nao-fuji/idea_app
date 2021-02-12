Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: "users/registrations",
  }
  devise_scope :user do
    get 'identification', to: 'users/registrations#new_identification'
    post 'identification', to: 'users/registrations#create_identification'
  end
  root to: 'ideas#index'
  get 'ideas/search'
  resources :ideas,except: :index do
    collection do
      get 'search'
    end
    resources :idea_purchases, only:[:index,:create]
    resources :likes, only: :create
    resources :dislikes, only: :create
  end
  resources :users, only: :show
  resources :recruits do
    resources :tweets, only: [:new,:create, :edit, :update] do
      resources :tweet_purchases, only:[:index, :create]
    end
  end
  resources :tweets, only: :destroy
end
