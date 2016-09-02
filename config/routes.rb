Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  mount Attachinary::Engine => "/attachinary"

  devise_for :users

  root to: 'services#index'

  get '/offers' => 'pages#offers'

  match '/webhook' => 'webhooks#receive', via: :post, defaults: { formats: :json }

  resources :services do
    resources :unsubs, only: [ :new, :show]
  end

  get '/unsub' => 'unsubs#show'

end
