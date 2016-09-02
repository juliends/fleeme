Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  mount Attachinary::Engine => "/attachinary"
  
  devise_for :users
  root to: 'services#index'

  match '/webhook/ugc' => 'webhooks#ugc', via: :post, defaults: { formats: :json }
  match '/webhook/user' => 'webhooks#user', via: :post, defaults: { formats: :json }

  resources :services do
    resources :unsubs, only: [ :new, :show]
  end

  get '/unsub' => 'unsubs#show'
  
end
