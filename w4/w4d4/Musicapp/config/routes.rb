Rails.application.routes.draw do
  resource :session, only: [:create, :new, :destroy]
  resources :users, only: [:create, :new, :show]

  resources :bands do
    resources :albums, except: [:index] do
      resources :tracks, except: [:index]
    end
  end
end
