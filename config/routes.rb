Rails.application.routes.draw do
#  get 'top/index'
  root "top#index"

  get "users/:action(/:name)" => "users"
  get "battles/:action(/:query)" => "battles"
  post "battles/:action(/:query)" => "battles"
  get "recruits/:action(/:query)" => "recruits"
  post "recruits/:action(/:query)" => "recruits"


  resources :users do
    collection {get "search"}
  end
  resources :battles do
    collection {get "search"}
  end
  resources :recruits do
    collection {post "search"}
    collection {get "fetch"}
    collection {post "accept"}
  end
end
