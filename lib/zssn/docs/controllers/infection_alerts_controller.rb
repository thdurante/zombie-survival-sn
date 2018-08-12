module Zssn
  module Docs
    module Controllers
      class InfectionAlertsController
        include Swagger::Blocks

        swagger_path '/infection_alerts' do
          operation :post do
            key :summary, 'Creates a new infection alert'
            key :description, 'Creates a new infection alert with author and infected survivor'
            key :produces, ['application/json']
            key :tags, ['Infection Alert']

            parameter name: :infection_alert,
                      description: 'Infection alert to add to the database',
                      in: :body,
                      required: true do
              schema do
                key :'$ref', :InfectionAlertCreateParams
              end
            end

            response 201 do
              key :description, 'Created response'

              schema do
                key :'$ref', :InfectionAlert
              end
            end

            response 422 do
              key :description, 'Unprocessable entity response'

              schema do
                key :'$ref', :Error
              end
            end
          end
        end
      end
    end
  end
end
