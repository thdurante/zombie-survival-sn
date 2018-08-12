module Zssn
  module Docs
    module Resources
      class Item
        include Swagger::Blocks

        swagger_schema :Item do
          key :required, %i(id survivor_id kind)

          property :id, type: :integer, format: :int64
          property :survivor_id, type: :integer, format: :int64
          property :kind, type: :string, enum: TradeItem.names
        end
      end
    end
  end
end
