Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  get "up" => "rails/health#show", as: :rails_health_check
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.local?

  devise_for :users
  unauthenticated { root to: "home#landing" }
  authenticated(:user) { root to: "home#dashboard", as: :authenticated_root }

  resources :projects do
    resources :comments, only: %i[new create], default: { commentable_type: "Project" }
  end

  resources :comments, only: %i[edit update destroy]
end
