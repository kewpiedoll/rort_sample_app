Rails.application.routes.draw do
  root 'static_pages#home'
  get '/help',    to: 'static_pages#help'
  get '/about',   to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/chris',   to: 'static_pages#chris'
  get '/jer',     to: 'static_pages#jer'
end
