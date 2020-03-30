Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :cars
  resources :parts
  resources :attachments
  resources :part_attachment_joiners

  get '/cars/:id/specs', to: 'cars#specs'
end
