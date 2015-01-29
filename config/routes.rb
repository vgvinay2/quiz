Rails.application.routes.draw do
  get 'home/index'

  devise_for :users
  root to: "home#index"

  resources :questions do
   get 'list',:on=> :collection
   get 'new_question',:on=> :collection
   get 'question_new_search',:on=> :collection
   get 'edit_question',:on=> :collection
   get 'delete_question',:on=> :collection
   get 'update_question',:on=> :collection
   post 'create_question',:on=> :collection
    end
end
