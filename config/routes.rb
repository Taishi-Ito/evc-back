Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :hello, only: [:index]
    end
  end
  resources :users, only: [:create, :show, :update, :destroy]
  delete "users/destroy" => "users#destroy"
  resources :work_groups, only: [:create, :update, :destroy]
  resources :projects, only: [:index, :create, :update, :destroy]
  resources :capital_investments, only: [:index, :update]
  resources :capital_investment_records, only: [:create, :update, :destroy]
  resources :pls, only: [:index, :update]
  resources :pl_records, only: [:create, :update, :destroy]
  resources :bsts, only: [:index, :update]
  resources :bst_records, only: [:create, :update, :destroy]
  resources :cfs, only: [:index, :update]
  resources :cf_records, only: [:create, :update, :destroy]
  get "search" => "projects#search"
end
