Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :users, only: %i[create index show]
  resources :costs, except: [:show]
  resources :groups
  get 'users/index'
  get 'costs/index'
  get 'costs/external', to: 'costs#external'
  get 'costs/all_costs', to: 'costs#all_costs'
end
