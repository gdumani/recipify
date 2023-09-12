Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get "/custom_sign_out" => "devise/sessions#destroy", as: :custom_destroy_user_session
  end

  resources :recipe_foods
  resources :foods
  resources :recipes
  resources :users
  
  # Defines the root path route ("/")
  root 'foods#index'
end
