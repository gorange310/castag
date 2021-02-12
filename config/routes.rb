Rails.application.routes.draw do
  root "pages#home"
  resources :podcasts, only: [:index, :show] do
    resources :episodes, only: [:index, :show] do
      collection do
        get :search
      end
    end
  end
  resources :episodes, only: [:index, :show] do
    collection do
      get :search
    end
  end
  
end
