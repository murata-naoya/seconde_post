Rails.application.routes.draw do
  root :to => "posts#new"
  post "posts" => "posts#create", as: "posts"
  get "done" => "posts#done", as: "post_done"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
