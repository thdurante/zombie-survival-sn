module Zssn
  module Docs
    module Definitions
      class InflectionAlert
        include Swagger::Blocks

        swagger_schema :InfectionAlert do
          key :required, %i(id author_id infected_user_id)

          property :id, type: :integer, format: :int64
          property :author_id, type: :integer, format: :int64
          property :infected_survivor_id, type: :integer, format: :int64
        end
      end
    end
  end
end
