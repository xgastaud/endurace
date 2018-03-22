Rails.application.routes.draw do
  devise_for :users,
      controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :races, only: [:index, :show]
  get 'privacy', to: 'pages#privacy', as: :privacy
  get 'tos', to: 'pages#tos', as: :tos
end
