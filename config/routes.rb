Rails.application.routes.draw do
  resources :podcasts, only: [:index, :show]
end
