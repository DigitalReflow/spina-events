Spina::Engine.routes.draw do
  namespace :events, path: '' do
    root to: 'conferences#index'

    resources :conferences, only: [:index, :show] do
      get '/venue', to: 'venues#show'
    end

    # Admin routes
    namespace :admin, path: Spina.config.backend_path do
      scope '/events' do
        resources :conferences
        resources :organisations
        resources :venues
      end
    end
  end
end
