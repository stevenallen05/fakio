Rails.application.routes.draw do
  resources :phone_numbers

  namespace :v1 do
    get 'PhoneNumbers(/:phone_number)', to: 'phone_numbers#lookup', as: 'phone_number_lookup'
    # get 'PhoneNumbers(/:messages)', to: 'messages#lookup', as: 'phone_number_lookup'
  end
  root to: 'phone_numbers#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
