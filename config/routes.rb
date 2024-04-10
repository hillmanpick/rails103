Rails.application.routes.draw do
  devise_for :users
  resources :groups do
    menber do
      post :join
      post :quit
    end 
    resources :posts

  end
  root 'groups#index'
end
