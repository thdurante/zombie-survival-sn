module Zssn
  module Docs
    module Resources
      class InflectionAlert
        include Swagger::Blocks

        swagger_schema :InfectionAlert do
          key :required, %i(id author_id infected_survivor_id)

          property :id do
            key :type, :integer
            key :format, :int64
          end

          property :author_id do
            key :type, :integer
            key :format, :int64
          end

          property :infected_survivor_id do
            key :type, :integer
            key :format, :int64
          end
        end
      end
    end
  end
end
