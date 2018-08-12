module Zssn
  module Docs
    module Resources
      class Survivor
        include Swagger::Blocks

        swagger_schema :Survivor do
          key :required, %i(id name age gender latitude longitude items
                            authored_infection_alerts received_infection_alerts)

          property :id, type: :integer, format: :int64
          property :name, type: :string
          property :age, type: :integer
          property :gender, type: :string, enum: Gender.names
          property :latitude, type: :number
          property :longitude, type: :number

          property :items, type: :array do
            items do
              key :'$ref', :Item
            end
          end

          property :authored_infection_alerts, type: :array do
            items do
              key :'$ref', :InfectionAlert
            end
          end

          property :received_infection_alerts, type: :array do
            items do
              key :'$ref', :InfectionAlert
            end
          end
        end
      end
    end
  end
end
