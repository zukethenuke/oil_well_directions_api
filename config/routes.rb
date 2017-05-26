Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    get '/wells' => 'nd_wells#index'
    get '/wells/:id' => 'nd_wells#show'
  end
end
