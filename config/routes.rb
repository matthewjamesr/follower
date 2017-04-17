Rails.application.routes.draw do
  resources :personas

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#welcome'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
