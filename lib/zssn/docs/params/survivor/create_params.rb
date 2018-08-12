module Zssn
  module Docs
    module Params
      module Survivor
        class CreateParams
          include Swagger::Blocks

          swagger_schema :SurvivorCreateParams do
            key :required, %i(name age gender latitude longitude items_attributes)

            property :name, type: :string
            property :age, type: :integer
            property :gender, type: :string, enum: %w(male female)
            property :latitude, type: :number
            property :longitude, type: :number

            property :items_attributes, type: :array do
              items do
                key :'$ref', :ItemAttribute
              end
            end
          end
        end
      end
    end
  end
end
