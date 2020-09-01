Rails.application.routes.draw do
  devise_for :users

  root 'homes#top'
  get 'home/about'
  get 'user/following/:id' => 'users#following', as: 'following'
  get 'user/followed/:id' => 'users#followed', as: 'followed'
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
  resources :posts do
   resource :favorites, only: [:create, :destroy]
   end
  resources :users,only: [:show,:index,:edit,:update]
  resources :post_comments, only: [:create, :destroy]
end
