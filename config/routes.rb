Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :users, only: :search
    collection do
      get 'search'
    end

  resources :groups, only: [:index, :new, :create, :edit, :update] do
    resources :messages, only: [:index, :create]
  end
end
