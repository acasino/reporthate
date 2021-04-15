Rails.application.routes.draw do

  root 'welcome#index'
  get '/auth/google_oauth2/callback', to: 'sessions/sessions#omniauth'


  get '/login', to: 'sessions/sessions#login', as: 'login'
  post '/login', to: 'sessions/sessions#create'
  get '/logout', to: 'sessions/sessions#logout', as: 'logout'

  # resources :volunteers, except: [:index] do
  #   resource :incidents, only: [:index, :new, :create]
  # end

  # get "/victims/:victim_id/incidents", to: "victims/incidents#index"
  # get "/victims/:victim_id/incidents/:incident_id", to: "victims/incidents#show"
  # get "/victims/:victim_id/incidents/edit", to: "victims/incidents#edit"
  # # get "/victims/:victim_id/incidents/new", to: "victims/incidents#new"
  # resources :victims, controller: 'victims/users' do 
  #   resource :incidents, controller: 'victims/incidents', shallow: true
  # end


  # resources :volunteers, controller: 'volunteers/users', path: 'volunteer', except: [:index] do
  #   resource :incidents, controller: 'volunteers/incidents'
  # end

  # resources :victims, controller: 'victims/users', path: 'victims', except: [:index] do 
  #   resource :incidents, controller: 'victims/incidents'
  # end

  resources :victims, controller: 'victims/users' do
    resources :incidents, controller: 'victims/incidents'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
