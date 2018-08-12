module Zssn
  module Docs
    module Params
      module Survivor
        class ItemAttribute
          include Swagger::Blocks

          swagger_schema :ItemAttribute do
            key :required, %i(kind)

            property :kind, type: :string, enum: %w(water food medication ammunition)
          end
        end
      end
    end
  end
end
