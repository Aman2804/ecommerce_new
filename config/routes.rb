Rails.application.routes.draw do
  namespace :admin do 
    resources :dashboards, :categories
  end
  devise_for :users
  root to:"home#index"
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
