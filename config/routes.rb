Rails.application.routes.draw do
  root to: redirect { |_params, _request|
    host = Rails
           .application
           .routes
           .url_helpers
           .docs_url(
             host: ENV.fetch('CANONICAL_HOST', 'localhost:3000'),
             protocol: Rails.env.development? ? :http : :https
           )

    "/apidocs/index.html?url=#{CGI.escape(host)}"
  }

  resources :docs, only: :index

  namespace :api do
    namespace :v1 do
      resources :survivors
    end
  end
end
