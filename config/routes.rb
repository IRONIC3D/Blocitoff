Rails.application.routes.draw do
  devise_for :users
  resources :todos, only: [:index, :new, :create, :destroy]

  get 'about' => 'welcome#about'

  authenticated :user do
    root to: 'todos#index'
  end
  
  root to: 'welcome#index'

end
