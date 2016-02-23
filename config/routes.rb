Rails.application.routes.draw do

  get 'transactions/new'

  get 'carts/show'

  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  resources :whiskies, only: [:show, :index]
  resources :transactions, only: [:new, :create]

  resource :cart, only: [:show] do
    put 'add/:whisky_id', to: 'carts#add', as: :add_to
    put 'remove/:whisky_id', to: 'carts#remove', as: :remove_from
  end

  root 'whiskies#index'
end
