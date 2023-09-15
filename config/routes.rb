Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update, :index]
  resources :books do
   resource :favorites, only: [:create, :destroy]
   resources :book_comments, only: [:create, :destroy]
  end
  root to: 'homes#top'
  get 'home/about'=> 'homes#about', as:'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
