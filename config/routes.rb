Rails.application.routes.draw do
  root 'groups#index'
  resources :groups, only: [:edit, :update] do
    resources :messages, only: [:new, :create]
  end
end
