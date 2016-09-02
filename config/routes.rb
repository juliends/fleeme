Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  mount Attachinary::Engine => "/attachinary"

  devise_for :users

  root to: 'services#index'

  resources :services do
    resources :unsubs, only: [ :new, :show]
  end

  get '/unsub' => 'unsubs#show'
  get '/offers' => 'pages#offers'

end
