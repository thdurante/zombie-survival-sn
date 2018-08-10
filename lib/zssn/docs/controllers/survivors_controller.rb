module Zssn
  module Docs
    module Controllers
      class SurvivorsController
        include Swagger::Blocks

        swagger_path '/survivors' do
          operation :get do
            key :summary, 'Lists all survivors'
            key :description, 'Returns a list with all survivors'
            key :produces, ['application/json']
            key :tags, ['Survivor']

            response 200 do
              key :description, 'Successful response'
              schema do
                key :type, :array
                items do
                  key :'$ref', :Survivor
                end
              end
            end
          end

          operation :post do
            key :summary, 'Creates a new survivor'
            key :description, 'Creates a new survival with associated items'
            key :produces, ['application/json']
            key :tags, ['Survivor']

            parameter name: :survivor,
                      description: 'Survivor to add to the database',
                      in: :body,
                      required: true do
              schema do
                key :'$ref', :SurvivorCreateParams
              end
            end

            response 201 do
              key :description, 'Created response'

              schema do
                key :'$ref', :Survivor
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
