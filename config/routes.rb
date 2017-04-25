Rails.application.routes.draw do
  root "top#index"

  %w(show search).each do |action|
    get "users/#{action}(/:name)", controller: "users", action: action
  end
  get "battles/show(/:query)", controller: "battles", action: "show"
  get "recruits/fetch(/:query)", controller: "recruits", action: "fetch"
  post "recruits/show", controller: "recruits", action: "show"

  resources :users do
  end
  resources :battles do
    collection {post "wake"}
  end
  resources :recruits do
    collection {post "search"}
    collection {post "accept"}
  end
end
