Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :users do
    resources :deals, only: [:index, :create]
    resources :items, only: [:create]
  end

  get "users/:user_id/deals/:id/accept" => "deals#accept", as: "accept"
  get "users/:user_id/deals/:id/cancel" => "deals#cancel", as: "cancel"
  get "users/:user_id/deals/:id/rate" => "deals#rate", as: "rate"
  get "users/:user_id/items/:id/out_of_stock" => "items#out_of_stock", as: "out_of_stock"
  get "users/:user_id/items/:id/back_in_stock" => "items#back_in_stock", as: "back_in_stock"
  mount Attachinary::Engine => "/attachinary"
end
