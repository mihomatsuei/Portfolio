Rails.application.routes.draw do
  get 'posts/edit'
  get 'posts/show'
  get 'users/edit'
  get 'users/show'
  devise_for :users
  # rootパス
  root 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
