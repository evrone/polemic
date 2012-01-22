Rails.application.routes.draw do
  resources :comments, :except => [:index, :edit, :update], :module => "Polemic"
end