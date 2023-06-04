Rails.application.routes.draw do
  root "gifts#index"
  resources :gifts, except: :show do
    get :buy, action: :buy_form, on: :member
    patch :buy, on: :member
    get :bought_gifts, on: :collection
  end
end
