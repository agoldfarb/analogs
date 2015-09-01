Rails.application.routes.draw do
  
  devise_for :users
  resources :users, only: [:update, :show, :index] do
    resources :vinyls do
      resources :reviews
    end
  end

  get 'welcome/about'

  root to: 'welcome#index'
end
