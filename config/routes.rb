Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  root to: 'users#new'
  resources :users, only: %i[show new] 
  
  resources :items, only: %i[index new create show destroy] do
    resources :orders, only: %i[index create]
  end

  resources :babies, only: %i[new create] do
    resources :articles, only: %i[index show new create destroy]
  end

end
