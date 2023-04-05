Rails.application.routes.draw do
  root :to =>"homes#top"
  get "/about" => "homes#about"
  
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

namespace :admin do
  resources :customers, only: [:index, :show, :edit, :update]
  get "/" => "homes#top"
  get "/customers/withdraw" => "customers#withdraw"
  resources :games, only: [:index, :show,:create, :edit, :update, :destroy]
  resources :genres, only: [:index, :edit, :create, :update]
end

scope module: :public do
  resource :customers, only: [:show, :update, :edit]
  resources :bordgames, only: [:new,:index, :show,:create, :edit, :update, :destroy]
  resources :games, only: [:new,:index, :show,:create, :edit, :update, :destroy]
  get "/search" => "games#search"
  get "/customers/withdraw" => "customers#withdraw"
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
