Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'sessions'}
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
  get '/odpowiedz/:id', to: 'odpowiedzias#respond', as: 'odpowiedz'
  post "/odpowiedz/:id", to: 'odpowiedzias#create'
  get "/uzytkownicy", to: "uzytkownicy#index"
  get "/oferty/twoje" , to: "oferty#twoje"
  get "/odpowiedzias/firma", to: "odpowiedzias#firma"
  get "/odpowiedzias/szczegoly/:id", to: "odpowiedzias#szczegoly" ,as: 'odpowiedz_index'

  # Defines the root path route ("/")
  # root "posts#index"
  resources :branzas
  resources :oferty
  resources :stanowiska
  resources :firma
  resources :odpowiedzias
  resources :uzytkownicy
end
