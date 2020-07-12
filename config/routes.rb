Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "home/about" => "homes#about"
  get "user/withdrawal" => "users#withdrawal"
  resources :users, only: [:show,:edit,:update, :destroy] do
    resource :relationships,only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

   post "tweets/new" => "tweets#new"
   resources :tweets do
    resources :comments, only: [:create, :destroy] do
      resource :favorites, only: [:create, :destroy]
    end
  end

   resources :directmessages, only: [:create, :destroy]
   resources :rooms, only: [:create, :show]
   resources :notifications, only: [:index]
   resources :activitys, only: [:show]
end
