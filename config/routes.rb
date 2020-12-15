Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %w(show create update destroy)
  resources :details, only: %w(index show create update destroy)
  resources :groups, only: %w(index create update destroy)
  get 'report', to: 'reports#show'
  put 'details/:id/add_to_group', to: 'details#add_to_group'
  put 'details/:id/remove_from_group', to: 'details#remove_from_group'
  get 'groups/:id/all_child_details', to: 'groups#index_with_details'
  put 'groups/:id/add_to_group', to: 'groups#add_to_group'
  put 'groups/:id/remove_from_group', to: 'groups#remove_from_group'
end
