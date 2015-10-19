Rails.application.routes.draw do

   root :to => "home#index"
   
   match ":controller(/:action(/:id))", :via => [:post,:get]

end
