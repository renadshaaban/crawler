Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "products", to: "products#index"
  namespace :api, defaults: {format: 'json'} do
      scope module: :v1 do
      	get "products" , to: "products#index"
      end
  end
end
