module Zssn
  module Docs
    module Controllers
      class ReportsController
        include Swagger::Blocks

        swagger_path '/reports/infected_survivors' do
          operation :get do
            key :summary, 'List of all infected survivors'
            key :description, 'List of all infected survivors'
            key :produces, ['application/json']
            key :tags, ['Report']

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
        end

        swagger_path '/reports/non_infected_survivors' do
          operation :get do
            key :summary, 'List of all non infected survivors'
            key :description, 'List of all non infected survivors'
            key :produces, ['application/json']
            key :tags, ['Report']

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
        end

        swagger_path '/reports/average_amount_of_trade_items' do
          operation :get do
            key :summary, 'Average amount of each trade item by survivor'
            key :description, 'Average amount of each trade item by survivor'
            key :produces, ['application/json']
            key :tags, ['Report']

            response 200 do
              key :description, 'Successful response'
              schema do
                key :type, :object
                key :required, %i(average_water_per_survivor average_food_per_survivor
                                  average_medication_per_survivor average_ammunition_per_survivor)

                property :average_water_per_survivor, type: :number
                property :average_food_per_survivor, type: :number
                property :average_medication_per_survivor, type: :number
                property :average_ammunition_per_survivor, type: :number
              end
            end
          end
        end

        swagger_path '/reports/points_lost_due_to_infection' do
          operation :get do
            key :summary, 'Points lost due to infected survivors'
            key :description, 'Points lost due to infected survivors'
            key :produces, ['application/json']
            key :tags, ['Report']

            response 200 do
              key :description, 'Successful response'
              schema do
                key :type, :object
                key :required, %i(points_lost_due_to_infection)

                property :points_lost_due_to_infection, type: :number
              end
            end
          end
        end
      end
    end
  end
end
