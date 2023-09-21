Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]

  resources :profiles do
    resources :likes, only: [:create, :destroy]
  end
  root 'profiles#index'

  get 'profiles/:id' => 'profiles#show',as: 'tweet'

  patch 'profiles/:id' => 'profiles#update'

  delete 'profiles/:id' => 'profiles#destroy'
  
  get 'profiles/:id/edit' => 'profiles#edit', as:'edit_tweet'

  get "top" => "profiles#top"

end
