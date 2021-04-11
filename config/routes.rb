Rails.application.routes.draw do
  resources :incidents
  resources :volunteers
  resources :victims
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
