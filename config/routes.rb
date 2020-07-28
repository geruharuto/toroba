# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#about'
  get 'user/withdrawal' => 'users#withdrawal'
  resources :users, only: %i(show edit update destroy) do
    resource :relationships, only: %i(create destroy)
    #get :follows, params: { on: :member }
    get 'follows' => 'users#follows', as: 'follows'
    get 'followers' => 'users#followers', as: 'followers'
    get 'followings_tweet' => 'tweets#followings_tweet'
    get 'followers_tweet' => 'tweets#followers_tweet'
  end

  post 'new' => 'tweets#new'
  resources :tweets do
    resource :favorites, only: %i(create destroy)
    resources :comments, only: %i(create destroy) do
      post 'favorites/comment_favorites' => 'favorites#comment_create'
      delete 'favorites/comment_destroy' => 'favorites#comment_destroy'
    end
  end

  resources :directmessages, only: [:create]
  resources :rooms, only: %i(create show)
  resources :notifications, only: [:index] do
    delete 'destroy_all'
  end
  resources :activitys, only: [:show]
end
