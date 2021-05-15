Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :series
      resources :stores
    end
    namespace :v2, defaults: { format: :json } do
      resources :stores
    end
  end
end
