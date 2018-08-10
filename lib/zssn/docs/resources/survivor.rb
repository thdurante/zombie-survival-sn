module Zssn
  module Docs
    module Resources
      class Survivor
        include Swagger::Blocks

        swagger_schema :Survivor do
          key :required, %i(id name age gender latitude longitude items
                            authored_infection_alerts received_infection_alerts)

          property :id do
            key :type, :integer
            key :format, :int64
          end

          property :name do
            key :type, :string
          end

          property :age do
            key :type, :integer
          end

          property :gender do
            key :type, :string
            key :enum, Gender.names
          end

          property :latitude do
            key :type, :number
          end

          property :longitude do
            key :type, :number
          end

          property :items do
            key :type, :array
            items do
              key :'$ref', :Item
            end
          end

          property :authored_infection_alerts do
            key :type, :array
            items do
              key :'$ref', :InfectionAlert
            end
          end

          property :received_infection_alerts do
            key :type, :array
            items do
              key :'$ref', :InfectionAlert
            end
          end
        end
      end
    end
  end
end
