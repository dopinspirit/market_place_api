require 'api_constraints'

Rails.application.routes.draw do

  devise_for :users
  
  namespace :api, defaults: { format: :json },
                              constrains: { subdomain: 'api' }, path: '/' do
    scope module: :v1, constrains: ApiConstraints.new(version: 1, default: true) do
      resources :users, :only => [:show]
    end
  end

end
