NightOwl::Application.routes.draw do
  root 'pages#home'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/me/:id', to: 'dashboard#index', as: :dashboard

  get '/logout', to: 'sessions#destroy', as: :logout

  get '/login', to: 'sessions#new', as: :login

  get '/waitlist', to: 'waitlist#index', as: :waitlist

  resources :keywords
end
