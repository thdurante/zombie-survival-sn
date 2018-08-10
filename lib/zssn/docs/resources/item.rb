module Zssn
  module Docs
    module Resources
      class Item
        include Swagger::Blocks

        swagger_schema :Item do
          key :required, %i(id survivor_id kind)

          property :id do
            key :type, :integer
            key :format, :int64
          end

          property :survivor_id do
            key :type, :integer
            key :format, :int64
          end

          property :kind do
            key :type, :string
          end
        end
      end
    end
  end
end
