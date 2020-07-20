Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "homes#about"
  get "user/withdrawal" => "users#withdrawal"
  resources :users, only: [:show, :edit, :update, :destroy] do
    resource :relationships,only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
    get "followings_tweet" => "tweets#followings_tweet"
    get "followers_tweet" => "tweets#followiner_tweet"
  end

  
   post "new" => "tweets#new"
   resources :tweets do
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
