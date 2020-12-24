Rails.application.routes.draw do
  get 'prototypes/index'
  get 'prototypes/show'
  get 'prototypes/new'
  get 'prototypes/edit'
  root to: "prototypes#index"
end
