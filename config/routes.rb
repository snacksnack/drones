Drones::Application.routes.draw do

  root to: 'pages#home'
  resources :strikes
  match "locations" => "strikes#locations"
  
end
