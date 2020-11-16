Rails.application.routes.draw do
  devise_for :users, controllers: {
    :registration => "users/registrations",
    :session => "users/sessions"
  }
  resources :tweets
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tweets#index'
end
