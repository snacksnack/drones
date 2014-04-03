Drones::Application.routes.draw do

  root to: 'pages#home'
  #get "pages/home"
  get "pages/about"

  resources :strikes
end
