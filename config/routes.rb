Rails.application.routes.draw do
  delete '/all' => 'every_resource#destroy'
  put '/match_requests/:id' => 'match_requests#create'
  get '/match_requests/:id' => 'match_requests#show'
end
