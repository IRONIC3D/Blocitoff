Rails.application.routes.draw do
  resources :todos, only: [:index, :new, :create, :destroy]

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
