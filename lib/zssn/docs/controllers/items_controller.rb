module Zssn
  module Docs
    module Controllers
      class ItemsController
        include Swagger::Blocks

        swagger_path '/items/trade' do
          operation :post do
            key :summary, 'Trade items between survivors'
            key :description, 'Trade items between survivors whenever permitted'
            key :produces, ['application/json']
            key :tags, ['Item']

            parameter name: :trade,
                      description: 'Trade params',
                      in: :body,
                      required: true do
              schema do
                key :required, %i(survivor_1 survivor_2)

                property :survivor_1, type: :object do
                  key :'$ref', :ItemTradeParams
                end

                property :survivor_2, type: :object do
                  key :'$ref', :ItemTradeParams
                end
              end
            end

            response 200 do
              key :description, 'Successful response'
              schema do
                key :type, :array
                items do
                  key :'$ref', :Item
                end
              end
            end

            response 422 do
              key :description, 'Unprocessable entity response'

              schema do
                key :'$ref', :Error
              end
            end

            response 403 do
              key :description, 'Forbidden response'

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
