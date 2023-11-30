Rails.application.routes.draw do
  resources :panel_members
  resources :users
  resources :work_step_panels
  resources :panels
  resources :work_steps
  resources :cases
  resources :institutions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
