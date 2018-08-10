module Zssn
  module Docs
    module Params
      module Survivor
        class ItemAttribute
          include Swagger::Blocks

          swagger_schema :ItemAttribute do
            property :kind, type: :string, required: true, enum: %w(water food medication ammunition)
          end
        end
      end
    end
  end
end
