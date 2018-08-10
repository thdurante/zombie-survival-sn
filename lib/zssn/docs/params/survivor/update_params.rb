module Zssn
  module Docs
    module Params
      module Survivor
        class UpdateParams
          include Swagger::Blocks

          swagger_schema :SurvivorUpdateParams do
            property :latitude, type: :number, required: true
            property :longitude, type: :number, required: true
          end
        end
      end
    end
  end
end
