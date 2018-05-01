Spina::Engine.routes.draw do
  namespace :events, path: '' do
    resources :conferences, only: [:index, :show] do
      get '/venue', to: 'venues#show'
      resources :speakers, only: [:index, :show]
      resources :sponsors, only: [:index]
      resources :questions, only: [:index]
      resources :tickets, only: [:index]
      resources :sessions, only: [:index, :show]
    end

    # Admin routes
    namespace :admin, path: Spina.config.backend_path do
      scope '/events' do

        resources :conferences do
        resources :sessions do
          post :sort, on: :collection
        end
        resources :speakers, controller: "conference/speakers", only: [:index, :update] do
          post :sort, on: :collection
        end
        get('speakers/edit', to: 'conference/speakers#edit', as: 'edit_admin_conference_speaker')
        end
        resources :session_types
        resources :organisations
        resources :venues
        resources :speakers
      end
    end
  end
end
