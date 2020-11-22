Rails.application.routes.draw do
  devise_for :users
  get 'home/about' => 'homes#about'
  root 'homes#top'
  #resources :users, only: [:show, :index, :edit, :update]
  resources :users do
    member do
     get :following, :followers
    end
  end

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  #フォローする
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  #フォロー外す
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'

end