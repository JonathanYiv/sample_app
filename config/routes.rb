Rails.application.routes.draw do
  get 'users/new'

  root 'static_pages#home'
  get  '/help',    	to: 'static_pages#help' #, as: 'helf' # this allows the route name to be different from the default
  get  '/about',   	to: 'static_pages#about'
  get  '/contact', 	to: 'static_pages#contact' # this defines contact_path and contact_url
  get '/signup', 		to: 'users#new'
end
 
# maps requests for the URL /static_pages/home to the home action in the StaticPages controller
# by using 'get' we arrange for the route to respond to a GET request