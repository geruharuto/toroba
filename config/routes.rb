Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "homes#about"
  get "user/withdrawal" => "users#withdrawal"
  resources :users, only: [:show, :edit, :update, :destroy] do
    resource :relationships,only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

   resources :tweets do
    collection do
      get "followings_tweet"
      get "followers_tweet"
      post "new"
    end
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy] do
      post "favorites/comment_favorites" => "favorites#comment_create"
      delete "favorites/comment_destroy" => "favorites#comment_destroy"
    end
  end

   resources :directmessages, only: [:create, :destroy]
   resources :rooms, only: [:create, :show]
   resources :notifications, only: [:index] do
    delete "destroy_all"
  end
   resources :activitys, only: [:show]
end
