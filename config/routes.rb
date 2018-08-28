Rails.application.routes.draw do
  root "missions#index"
  resources :missions do
    collection do
      get :search #create a route for search!
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
