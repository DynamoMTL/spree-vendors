Rails.application.routes.draw do
  namespace :admin do 
    resources :vendors
  end
end
