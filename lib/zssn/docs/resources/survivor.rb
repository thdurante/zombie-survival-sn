module Zssn
  module Docs
    module Resources
      class Survivor
        include Swagger::Blocks

        swagger_schema :Survivor do
          property :id, type: :integer, format: :int64, required: true
          property :name, type: :string, required: true
          property :age, type: :integer, required: true
          property :gender, type: :string, required: true, enum: Gender.names
          property :latitude, type: :number, required: true
          property :longitude, type: :number, required: true

          property :items, type: :array, required: true do
            items do
              key :'$ref', :Item
            end
          end

          property :authored_infection_alerts, type: :array, required: true do
            items do
              key :'$ref', :InfectionAlert
            end
          end

          property :received_infection_alerts, type: :array, required: true do
            items do
              key :'$ref', :InfectionAlert
            end
          end
        end
      end
    end
  end
end
