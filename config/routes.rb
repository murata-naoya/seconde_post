Rails.application.routes.draw do
  resources :posts
  get "done" => "posts#done", as: "post_done"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
