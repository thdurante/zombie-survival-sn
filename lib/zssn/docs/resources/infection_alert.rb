module Zssn
  module Docs
    module Resources
      class InflectionAlert
        include Swagger::Blocks

        swagger_schema :InfectionAlert do
          property :id, type: :integer, format: :int64, required: true
          property :author_id, type: :integer, format: :int64, required: true
          property :infected_survivor_id, type: :integer, format: :int64, required: true
        end
      end
    end
  end
end
