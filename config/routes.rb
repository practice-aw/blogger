Rails.application.routes.draw do
  resources :articles

  get '/articles/:id', to: "articles#show"
end
