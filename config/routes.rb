NightOwl::Application.routes.draw do
  root 'pages#home'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/me/:id', to: 'dashboard#index', as: :dashboard
end
