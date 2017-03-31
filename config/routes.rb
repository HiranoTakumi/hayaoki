Rails.application.routes.draw do
#  get 'top/index'
  root "top#index"



  resources :users do
    collection {get "search"}
  end
  resources :battles do
    collection {get "search"}
  end
end
