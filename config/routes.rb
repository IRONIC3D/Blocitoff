Rails.application.routes.draw do
  devise_for :users
  resources :todos, only: [:index, :create, :destroy]

  authenticated :user do
    root to: 'todos#index', as: :authenticated_root
  end

  root to: 'welcome#index'

end
