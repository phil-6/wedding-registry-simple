Rails.application.routes.draw do
  root "items#index"
  resources :items, except: :show do
    get :buy, action: :buy_form, on: :member
    patch :buy, on: :member
    get :bought_items, on: :collection
  end
end
