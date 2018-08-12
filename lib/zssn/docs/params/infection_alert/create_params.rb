module Zssn
  module Docs
    module Params
      module InfectionAlert
        class CreateParams
          include Swagger::Blocks

          swagger_schema :InfectionAlertCreateParams do
            key :required, %i(author_id infected_survivor_id)

            property :author_id, type: :integer, format: :int64
            property :infected_survivor_id, type: :integer, format: :int64
          end
        end
      end
    end
  end
end
