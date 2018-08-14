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

      get 'reports/infected_survivors'
      get 'reports/non_infected_survivors'
      get 'reports/average_amount_of_trade_items'
      get 'reports/points_lost_due_to_infection'
    end
  end
end
