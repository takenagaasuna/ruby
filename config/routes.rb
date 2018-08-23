Rails.application.routes.draw do
  get 'admin' => 'admin#index'
  
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    resources :posts do
      resources :comments, only: [:create, :destroy]
    end
    
    root 'sessions#new'
    
end
