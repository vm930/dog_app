Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get '/login', to: 'sessions#new', as: 'login'
post '/login', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy', as: 'logout'
patch '/appointments/:id/toggle', to: 'appointments#appointment_toggle', as: 'appointment_helper'

root 'application#welcome', as: "home"
get '/get_started', to: "application#get_started", as: "get_started"
resources :users
resources :dogs
resources :appointments
# patch '/appointments/:id/appt_set', to: "appointment#set_appt_user", as "set_user"
end
