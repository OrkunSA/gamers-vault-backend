Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  resources :sessions, only: [:create]
  resources :games

  #USER ROUTES
  get 'user/collections', to: 'users#collection'
  resources :users, only: [:create, :index]

  #SESSION ROUTES
  get 'logged_in', to: 'sessions#logged_in'
  delete 'logout', to: 'sessions#logout'

  #GAME ROUTES
  post '/games/:id', to: 'games#game_collection'

end
