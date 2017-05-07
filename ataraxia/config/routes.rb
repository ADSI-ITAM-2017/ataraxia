Rails.application.routes.draw do

	#default

  get '/' => 'home#index'
  get 'home/index'

	post 'users/create' => 'users#create'
	get 'users/new' => 'users#new'
	get 'users' => 'users#index'
  get 'users/login' => 'users#login'
  post 'users/login' => 'users#loginValidate'
  get 'users/dashboard' => 'users#dashboard'
  get 'users/dashboard/logout' => 'users#dashboardLogout'


	post 'properties/create' => 'properties#create'
	post 'properties/show' => 'properties#show'
	get 'properties/new' => 'properties#new'
	get 'properties' => 'properties#index'
	get 'properties/show' => 'properties/show'
	get 'properties/information' => 'properties#information'
  
    post 'proposals/create' => 'proposals#create'
    get 'proposals/accept' => 'proposals#accept'


  resources :conversations do
    resources :messages
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
