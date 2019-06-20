Rails.application.routes.draw do
  namespace :admin do 
    resources :dashboards
    resources :categories do
      resources :item, controller: '/admin/items' do
        resources :pictures
      end
    end
  end
  map.resources :items do |item|
    item.resources :pictures
  end
  devise_for :users
  root to:"home#index"
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
