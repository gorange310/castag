Rails.application.routes.draw do
  root "podcasts#index"
  resources :podcasts, only: [:index, :show] do
    resources :episodes, only: [:index, :show]
  end
  
end
