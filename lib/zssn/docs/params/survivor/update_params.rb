module Zssn
  module Docs
    module Params
      module Survivor
        class UpdateParams
          include Swagger::Blocks

          swagger_schema :SurvivorUpdateParams do
            key :required, %i(latitude longitude)

            property :latitude, type: :number
            property :longitude, type: :number
          end
        end
      end
    end
  end
end
