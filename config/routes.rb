Rails.application.routes.draw do

  namespace :api, defaults: { format: :json },
                              constrains: { subdomain: 'api' }, path: '/' do
    scope module: :v1, constrains: ApiConstraints.new(version: 1, default: true) do

    end
  end

end
