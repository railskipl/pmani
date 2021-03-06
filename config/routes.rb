DemoCloud::Application.routes.draw do 
 
  resources :consumers do
    post "subzone", :on=> :collection
    get "accept", :on=> :member
    get "reject", :on=> :member
  end

  resources :readers do
    post "subzone", :on=> :collection
  end

get "password_resets/new"

  match '/user/:id/dtc_staffs', :controller => "users", :action => "dtc"
  match '/dtc_staff/:dtc', :to => "consumers#dtc"



match '/change_password', :controller => 'users', :action => 'change_password'

  resources :users do
    get 'zone_json', :on=> :collection
    get 'sub_zone_json', :on=> :collection
  end
 
  resources :sessions, :only => [:new,:create,:destroy,:edit]
  root :to => 'sessions#new'
  match 'dashboard' => 'users#dashboard', :as => 'user_root'
  match '/signup', :to =>'users#new'
  match '/signin', :to =>'sessions#new'
  match  '/users/:id/edit',  :to => "users#edit" 
  match '/signout', :to =>'sessions#destroy'
 resources :password_resets
 
 match '/edu_class/:id/status', :to => "edu_classes#toggled_status"
 match '/edu_classes/:id/delete', :to => "edu_classes#destroy"
  match '/subjects/:id/delete', :to => "subjects#destroy"

 resources :edu_classes 
 resources :subjects
 
end
