Spina::Engine.routes.draw do
  namespace :events do
    root to: 'conferences#index'

    resources :conferences, only: [:index, :show]
  end

  namespace :admin do
    namespace :events do
      resources :conferences
      resources :organisations
    end
  end
end
