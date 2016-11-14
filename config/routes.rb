Rails.application.routes.draw do
  resources :countries do
    resources :dishes, shallow: true
  end
  
  #...go
  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "countries#index"
  
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/:provider', to: lambda{|env| [404, {}, ["Not Found"]]}, as: 'auth'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
