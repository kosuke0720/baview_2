Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  root to: 'users#new'
  resources :users, only: %i[show new edit update] 
  resources :favorites, only: %i[create destroy]
  
  resources :items do
    resources :orders, only: %i[index create]
  end

  resources :babies, only: %i[new create destroy update edit] do
    resources :articles
  end

end
