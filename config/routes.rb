Rails.application.routes.draw do
  resources :comments, :except => [:edit, :update], :module => :"BlahBlahBlah"
end