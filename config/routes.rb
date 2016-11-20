Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/products' => 'products#index'
  post'/products/search' => 'products#search'
  get 'products/new' => 'products#new'
  get '/products/:id' => 'products#show'
  post 'products' => 'products#create'
  get 'products/:id/edit' => 'products#edit'
  patch 'products/:id' => 'products#update'
  delete 'products/:id' =>
  'products#destroy'
end
