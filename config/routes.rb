Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :groups, only: [:create, :edit, :update] do
    resources :messages, only: [:new, :create]
  end
end
