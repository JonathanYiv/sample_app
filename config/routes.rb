Rails.application.routes.draw do
  get 'static_pages/home' # maps requests for the URL /static_pages/home to the home action in the StaticPages controller
  # by using 'get' we arrange for the route to respond to a GET request

  get 'static_pages/help'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'
end
