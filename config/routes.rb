Spina::Engine.routes.draw do
  namespace :events do
    root to: 'conferences#index'

    resources :conferences, only: [:index, :show] do
      get '/venue', to: 'venues#show'
    end
  end

  namespace :admin do
    namespace :events do
      resources :conferences
      resources :organisations
      resources :venues
    end
  end
end
