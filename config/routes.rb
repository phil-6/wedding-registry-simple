Rails.application.routes.draw do
  root "gifts#index"
  resources :gifts, except: :show do
    resources :gifters, only: [:new, :create]
    get :bought_gifts, on: :collection
  end
end
