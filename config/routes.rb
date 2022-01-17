Rails.application.routes.draw do
  # Routes for the Writer resource:

  # CREATE
  post("/insert_writer", { :controller => "writers", :action => "create" })
          
  # READ
  get("/writers", { :controller => "writers", :action => "index" })
  
  get("/writers/:path_id", { :controller => "writers", :action => "show" })
  
  # UPDATE
  
  post("/modify_writer/:path_id", { :controller => "writers", :action => "update" })
  
  # DELETE
  get("/delete_writer/:path_id", { :controller => "writers", :action => "destroy" })

  #------------------------------

  # Routes for the Publication resource:

  # CREATE
  post("/insert_publication", { :controller => "publications", :action => "create" })
          
  # READ
  get("/publications", { :controller => "publications", :action => "index" })
  
  get("/publications/:path_id", { :controller => "publications", :action => "show" })
  
  # UPDATE
  
  post("/modify_publication/:path_id", { :controller => "publications", :action => "update" })
  
  # DELETE
  get("/delete_publication/:path_id", { :controller => "publications", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get("/", {:controller => "application", action: "homepage"})
end
