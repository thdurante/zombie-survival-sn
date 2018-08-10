module Zssn
  module Docs
    module Params
      module Survivor
        class CreateParams
          include Swagger::Blocks

          swagger_schema :SurvivorCreateParams do
            property :name, type: :string, required: true
            property :age, type: :integer, requied: true
            property :gender, type: :string, required: true, enum: %w(male female)
            property :latitude, type: :number, required: true
            property :longitude, type: :number, required: true

            property :items_attributes, type: :array, required: true do
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
