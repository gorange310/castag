Rails.application.routes.draw do
  resources :podcasts, only: [:index, :show] do
    resources :episodes, only: [:index, :show]
  end
  
end
