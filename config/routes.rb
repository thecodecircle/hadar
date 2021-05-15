Rails.application.routes.draw do
  resources :events
  devise_for :users
  get :user_index, to: "application#user_index"
  post :set_user_role, to: "application#set_user_role"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "events#index"
end
