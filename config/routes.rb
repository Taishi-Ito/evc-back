Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :hello, only: [:index]
      resources :users, only: [:create, :update, :show]
      delete "users/destroy" => "users#destroy"
    end
  end
end
