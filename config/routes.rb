Rails.application.routes.draw do

  root 'welcome#index'

  resources :incidents

  resources :volunteers

  resources :victims, controller: 'victims/users', path: 'victim', except: [:index] do 
    resource :incidents, controller: 'victims/incidents'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
