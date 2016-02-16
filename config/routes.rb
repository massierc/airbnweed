Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  resources :users do
    resources :deals, only: [:index, :create]
    resources :items, only: [:create]
  end

  get "users/:user_id/deals/:id/accept" => "deals#accept", as: "accept"
  get "users/:user_id/deals/:id/cancel" => "deals#cancel", as: "cancel"
  get "users/:user_id/deals/:id/rate" => "deals#rate", as: "rate"
  mount Attachinary::Engine => "/attachinary"
end
