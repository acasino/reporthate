Rails.application.routes.draw do

  root 'welcome#index'
  get '/auth/google_oauth2/callback', to: 'sessions/sessions#omniauth'

  get '/login', to: 'sessions/sessions#login', as: 'login'
  post '/login', to: 'sessions/sessions#create'
  get '/logout', to: 'sessions/sessions#logout', as: 'logout'

  resources :victims, controller: 'victims/users' do
    resources :incidents, controller: 'victims/incidents'
  end

  resources :volunteers, controller: 'volunteers/users' do
    resources :victims, controller: 'volunteers/victims'
    resources :incidents, controller: 'volunteers/incidents'
  end

  resources :incidents, controller: 'incidents/incidents', only: [:index, :show, :update] do
    collection do
      get :not_yet_contacted
      get :not_yet_assigned
      get :time_occurred_desc
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
