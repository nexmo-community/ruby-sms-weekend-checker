Rails.application.routes.draw do
  get '/', to: 'weekend_checker#index'
  get '/webhooks/event', to: 'weekend_checker#event'
  post '/recipient/new', to: 'weekend_checker#create'
end
