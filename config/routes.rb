Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  mount Attachinary::Engine => "/attachinary"

  devise_for :users

  root to: 'services#index'

  resources :services do
    resources :unsubs, only: [ :new, :show]
  end

  match '/webhook/user' => 'webhooks#user', via: :post, defaults: { formats: :json }
  match '/webhook/ugc' => 'webhooks#ugc', via: :post, defaults: { formats: :json }

  get '/unsub' => 'unsubs#show'
  get '/offers' => 'pages#offers'

end
