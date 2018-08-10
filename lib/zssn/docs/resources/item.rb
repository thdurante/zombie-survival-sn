module Zssn
  module Docs
    module Resources
      class Item
        include Swagger::Blocks

        swagger_schema :Item do
          property :id, type: :integer, format: :int64, required: true
          property :survivor_id, type: :integer, format: :int64, required: true
          property :kind, type: :string, required: true, enum: TradeItem.names
        end
      end
    end
  end
end
