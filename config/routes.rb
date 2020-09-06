Rails.application.routes.draw do
  devise_for :users

  root 'homes#top'
  get 'homes/about'
  get 'user/following/:id' => 'users#following', as: 'following'
  get 'user/followed/:id' => 'users#followed', as: 'followed'
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
  resources :posts , only: [:index, :show, :edit, :create, :update, :destroy,:new] do
   resource :thank_yous, only: [:create, :destroy]
   resource :do_our_bests, only: [:create, :destroy]
   end
  resources :users,only: [:show,:index,:edit,:update]
   get 'users/:id/choice' => 'users#choice', as: 'user_choice'
  resources :post_comments, only: [:create, :destroy]
end
