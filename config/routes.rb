Rails.application.routes.draw do
#  get 'top/index'
  root "top#index"

  get "users/:action(/:name)" => "users"
  get "battles/:action(/:query)" => "battles"


  resources :users do
    collection {get "search"}
  end
  resources :battles do
    collection {get "search"}
  end
end
