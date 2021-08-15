Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :v1 do
    get 'users/hash', to: 'users#create_hash'
    resources :rooms, only: %i[index create] do
      resources :messages, only: %i[index create]
    end
    resources :reactions, only: %i[index]
  end
end
