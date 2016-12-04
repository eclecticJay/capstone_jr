Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/products' => 'products#index'
  post'/products/search' => 'products#search'
  get '/products/new' => 'products#new'
  get '/products/:id' => 'products#show'
  post '/products' => 'products#create'
  get '/products/:id/edit' => 'products#edit'
  patch '/products/:id' => 'products#update'
  delete '/products/:id' =>'products#destroy'
  
  #supplier
  get '/suppliers' => 'suppliers#index'
  get '/suppliers/new' => 'suppliers#new'
  get '/suppliers/:id' => 'suppliers#show'
  post '/suppliers' => 'suppliers#create'
  get '/suppliers/:id/edit' => 'suppliers#edit'


  #Authentication
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # Orders
  post '/orders' => 'orders#create'
  get  '/orders/:id' => 'orders#show'

  #CartedProducts
  get '/carted_products' => 'carted_products#index'
  post '/carted_products' => 'carted_products#create'
  get '/carted_products/:id' => 'carted_products#show'
  delete '/carted_products/:id' => 'carted_products#destroy'

end
