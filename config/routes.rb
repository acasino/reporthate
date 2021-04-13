Rails.application.routes.draw do

  root 'welcome#index'

  get '/login', to: 'sessions/sessions#login', as: 'login'
  post '/login', to: 'sessions/sessions#create'

  get '/logout', to: 'sessions/sessions#logout', as: 'logout'

  # resources :incidents

  resources :volunteers, controller: 'volunteers/users', path: 'volunteer', except: [:index] do
    resource :incidents, controller: 'volunteers/incidents'
  end

  resources :victims, controller: 'victims/users', path: 'victim', except: [:index] do 
    resource :incidents, controller: 'victims/incidents'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
