Rails.application.routes.draw do
	get "/pages/about" => "pages#about" ,as: :about
	get "/pages/contact" => "pages#contact",as: :contact
	get "/pages/web" => "pages#web", as: :web
# get "/posts" => "posts#index" ,as: :index_post
# get "/posts/new" => "posts#new" ,as: :add
# get "/post/:id" => "posts#show" ,as: :post
# patch "post/:id" => "posts#update"
# delete "post/:id" => "posts#destroy",as: :delete_post
# post"/posts" => "posts#create"
# get "/post/:id/edit" =>"posts#edit", as: :edit_post
 
 	root"posts#index"
 	resources :posts do
 		 resources :comments


 	end

# get "comments/post/:id" => "comment#show"
# get "comments/post/:id/new" => "comment#new"
# get "comments/post/:id/edit" => "comment#edit"
# get "comments/post/:id/delete" => "comment#delete"

end
