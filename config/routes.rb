Rails.application.routes.draw do
  
  devise_for :users
  resources :users, only: [:show, :top, :edit, :update, :index, :destroy]
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy]
  get 'home/about' =>  'books#about'
  root 'users#top'





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
