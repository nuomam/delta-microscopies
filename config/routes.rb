Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # ADMIN
  get "/deltadmin", to: 'deltadmin/pages#dashboard'
  namespace :deltadmin do
    resources :categories
  end


end
