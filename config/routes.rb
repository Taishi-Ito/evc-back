Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :hello, only: [:index]
    end
  end
  resources :users, only: [:create, :show, :update]
  delete "users/destroy" => "users#destroy"
  resources :work_groups
end
