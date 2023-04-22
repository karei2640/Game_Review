Rails.application.routes.draw do
  
  resources :faqs, only: [:index]
  resources :notices, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  root :to =>"homes#top"
  get "/about" => "homes#about"
  get '/search', to: 'searchs#index'
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

namespace :admin do
  resources :customers, only: [:index, :show, :edit, :update]
  get '/search', to: 'searchs#index'
  get "/" => "homes#top"
  get "/customers/withdraw" => "customers#withdraw"
  resources :games, only: [:index, :show,:create, :edit, :update, :destroy] do
    resources :comments, only: [:destroy]
    resources :bordgame_comments, only: [:destroy]
  end
  resources :bordgames, only: [:index, :show,:create, :edit, :update, :destroy] do
  end
  get 'popular', to: 'games#popular_index'
  get 'favorite', to: 'games#favorite_index'
  get 'bord_popular', to: 'bordgames#popular_index'
  get 'bord_favorite', to: 'bordgames#favorite_index'
  resources :genres, only: [:index,:new, :edit, :create, :update] # ジャンルの追加機能
  resources :tables, only: [:index,:new, :edit, :create, :update]# テーブルジャンルの追加機能
  resources :tableplats, only: [:index,:new, :edit, :create, :update]
  resources :categories, only: [:index,:new, :edit, :create, :update]# カテゴリの追加機能
  resources :platforms, only: [:index,:new, :edit, :create, :update]# プラットフォームの追加機能
end

scope module: :public do
  get '/search', to: 'searchs#index'
  get "/customers/unsubscribe" => "customers#unsubscribe"
  get "/customers/withdrawl" => "customers#withdrawl"
  resources :customers, only: [:show, :update, :edit] do
    get :bord_show, on: :member
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :bordgames, only: [:new,:index, :show,:create, :edit, :update, :destroy] do
    resources :bordgame_comments, only: [:create, :destroy]
    resource :bord_favorites, only: [ :create, :destroy]
  end
  resources :bord_favorites, only: [:index]
  resources :games, only: [:new, :index, :show, :create, :edit, :update, :destroy] do
    resources :game_comments, only: [:create, :destroy] do
    resources :replies, only: [:create, :destroy]
  end
    resource :favorites, only: [:create, :destroy]
  end
  get 'popular', to: 'games#popular_index'
  get 'favorite', to: 'games#favorite_index'
  get 'bord_popular', to: 'bordgames#popular_index'
  get 'bord_favorite', to: 'bordgames#favorite_index'
  resources :favorites, only: [:index]
  get "/search" => "games#search"
end
resources :inquiries, only: [:new, :show, :edit, :create, :update] do
  collection do
    get 'status/:status', action: :status, as: :status
    get 'untreated'
    get 'processing'
    get 'completed'
  end
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
