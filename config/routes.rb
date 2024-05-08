Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "public#home"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "/oferty", to: "oferty#index"
  get "/branzas/add", to: "branzas#new"
  get "/branzas", to: "branzas#index"
  get "/firma", to: "firma#index"
  get "/firma/add", to: "firma#new"
  get "/oferty/add", to: "oferty#new"
  get "/stanowiska", to: "stanowiska#index"
  get "/stanowiska/add", to: "stanowiska#new"
  # Defines the root path route ("/")
  # root "posts#index"
  resources :branzas
  resources :oferty
  resources :stanowiska
  resources :firma
end
