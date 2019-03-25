Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'application#welcome'
get '/get_started', to: "application#get_started", as: "get_started"
resources :users, only:[:show,:index,:create,:edit,:new,:update]
resources :dogs
  
end
