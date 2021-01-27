Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  resources :sessions, only: [:create]
  resources :users, only: [:create]
  get 'logged_in', to: 'sessions#logged_in'
  delete 'logout', to: 'sessions#logout'
end
