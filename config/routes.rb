Rails.application.routes.draw do
  devise_for :users, controllers: {
    :registration => "users/registrations",
    :session => "users/sessions"
  }
  resources :tweets
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tweets#index'
  post 'likes/:tweet_id', to: 'likes#create', as: 'likes'
  post 'tweets/:tweet_id/retweet', to: 'tweets#retweet', as: 'retweet'
end
