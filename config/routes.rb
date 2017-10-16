Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  root   'static_pages#home'
  get    '/help',    	to: 'static_pages#help' #, as: 'helf' # this allows the route name to be different from the default
  get    '/about',   	to: 'static_pages#about'
  get    '/contact',  to: 'static_pages#contact' # this defines contact_path and contact_url
  get    '/signup', 	to: 'users#new'
  post   '/signup',   to: 'users#create'
  get    '/login',    to: 'sessions#new'
  post   '/login',    to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end
 
# maps requests for the URL /static_pages/home to the home action in the StaticPages controller
# by using 'get' we arrange for the route to respond to a GET request