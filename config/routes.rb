Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %w(show create update destroy)
  resources :details, only: %w(index show create update destroy)
  resources :groups, only: %w(create update destroy)
end
