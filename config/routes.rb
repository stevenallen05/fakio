Rails.application.routes.draw do
  resources :messages, only: %i[index show]
  resources :phone_numbers

  get '/v1/PhoneNumbers(/:phone_number)', to: 'phone_numbers#lookup', as: 'phone_number_lookup'
  post '/2010-04-01/Accounts/(:sid)/Messages', to: 'messages#create', as: 'post_message'

  root to: 'messages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
