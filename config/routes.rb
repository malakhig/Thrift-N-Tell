Rails.application.routes.draw do
  get 'notifications/index'
  get "thrifts/lazy_load", to: "thrifts#lazy_load"
  post 'send_request', to: 'request_thrifts#send_request'
  resources :thrifts do
    member do 
      delete :remove_image
    end
  end
  resources :posts do
     member do 
      delete :remove_image
    end
    resources :comments do
      member do
        put 'like', to: 'comments#like'      
      end      
    end
    member do 
      put 'like', to: 'posts#like'
    end
  end
  
  devise_for :users
  
  devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'     
 end

 post 'profile/:id/follow', to: 'profile#follow', as: 'follow'
 post 'profile/:id/unfollow', to: 'profile#unfollow', as: 'unfollow'
 post 'profile/:id/accept', to: 'profile#accept', as: 'accept'
 post 'profile/:id/decline', to: 'profile#decline', as: 'decline'
 post 'profile/:id/cancel', to: 'profile#cancel', as: 'cancel'

 get 'profile/:id', to:'profile#show', as:'profile'



 resources :thrifts, only: [:index, :show]
 resources :users, only: [:index]

  #get 'home/index'
  root 'home#about'
  get 'home/your_finds'
  get 'home/index'
  get "up" => "rails/health#show", as: :rails_health_check

  
end
