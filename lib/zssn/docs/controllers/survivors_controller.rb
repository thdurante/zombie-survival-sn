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

        swagger_path '/survivors/{id}' do
          operation :get do
            key :summary, 'Shows survivor'
            key :description, 'Returns the selected survivor'
            key :produces, ['application/json']
            key :tags, ['Survivor']

            parameter name: :id,
                      description: 'ID of the desired Survivor',
                      in: :path,
                      type: :integer,
                      format: :int64,
                      required: true

            response 200 do
              key :description, 'Successful response'
              schema do
                key :'$ref', :Survivor
              end
            end
          end

          operation :put do
            key :summary, 'Updates survivor'
            key :description, 'Updates the selected survivor'
            key :produces, ['application/json']
            key :tags, ['Survivor']

            parameter name: :id,
                      description: 'ID of the desired Survivor',
                      in: :path,
                      type: :integer,
                      format: :int64,
                      required: true

            parameter name: :survivor,
                      description: 'Survivor update params',
                      in: :body,
                      required: true do
              schema do
                key :'$ref', :SurvivorUpdateParams
              end
            end

            response 200 do
              key :description, 'Successful response'
              schema do
                key :'$ref', :Survivor
              end
            end
          end

          operation :delete do
            key :summary, 'Deletes survivor'
            key :description, 'Deleted the selected survivor'
            key :produces, ['application/json']
            key :tags, ['Survivor']

            parameter name: :id,
                      description: 'ID of the desired Survivor',
                      in: :path,
                      type: :integer,
                      format: :int64,
                      required: true

            response 204 do
              key :description, 'No content - Deleted successfully'
            end
          end
        end
      end
    end
  end
end
