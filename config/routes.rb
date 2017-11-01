Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    get '/wells' => 'nd_wells#index'
    get '/wells/random' => 'nd_wells#random'
    get '/wells/all_operators' => 'nd_wells#all_operators'
    get '/wells/startup' => 'nd_wells#app_startup_data'
    get '/wells/:id' => 'nd_wells#show'
  end
end
