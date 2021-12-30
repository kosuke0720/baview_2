Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  root to: 'users#new'
  resources :users, only: %i[show new edit update] 
  
  resources :items, only: %i[index new create show destroy] do
    resources :orders, only: %i[index create]
  end

  resources :babies, only: %i[new create destroy] do
    resources :articles, only: %i[index show new create destroy]
  end

end
