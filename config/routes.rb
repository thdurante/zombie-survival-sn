Rails.application.routes.draw do
  root to: redirect('/apidocs')

  mount SwaggerUiEngine::Engine, at: 'apidocs'

  resources :docs, only: :index

  namespace :api do
    namespace :v1 do
      resources :survivors
      resources :infection_alerts, only: :create
      resources :items, only: [] do
        collection do
          post :trade
        end
      end
    end
  end
end
