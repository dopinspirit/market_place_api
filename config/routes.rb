Rails.application.routes.draw do

  namespace :api, defaults: { format: :json },
                              constrains: { subdomain: 'api' }, path: '/' do
    
  end

end
