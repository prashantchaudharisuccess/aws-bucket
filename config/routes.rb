Rails.application.routes.draw do
	resources :profiles
  resources :coffers
  devise_for :users
  root :to => "home#index"
  get 'root/coffer/new'
  get '/signedinuserprofile' => 'profiles#signedinuserprofile' 
  get '/registrationnew' => 'devise/registrations#new'
  resources :disks
  resources :bucket_files
  get '/files/disk/move_file_form/:disk_name/:file_name', to: 'bucket_files#move_file_form', as: 'move_file_form'
  # get '/disks', to: 'disks#index', as: disks_path
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	get '/disks/:disk_id/calculate_disk', to: 'disks#calculate_disk_size', as: 'calculate_disk_size'
	get '/disks/:disk_id/disk_file_upload/:name', to: 'bucket_files#disk_file_upload', as: 'disk_file_upload'
  post '/files/disk/move_file_form/:disk_name/:file_name', to: 'bucket_files#file_move', as: 'file_move_path'

end
