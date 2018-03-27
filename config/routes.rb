Rails.application.routes.draw do
  mount ForestLiana::Engine => '/forest'
  devise_for :users,
      controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :races, only: [:index, :show] do
    post 'like', to: 'races#like', as: :like
  end

  resources :races do
    resources :reviews, only: [ :create ]
  end

  get 'privacy', to: 'pages#privacy', as: :privacy
  get 'tos', to: 'pages#tos', as: :tos
  get 'dashboard', to: 'pages#dashboard', as: :dashboard
end
