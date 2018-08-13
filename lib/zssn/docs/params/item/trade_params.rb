module Zssn
  module Docs
    module Params
      module Item
        class TradeParams
          include Swagger::Blocks

          swagger_schema :ItemTradeParams do
            key :required, %i(id) + TradeItem.names

            property :id, type: :integer, format: :int64
            property :water, type: :integer
            property :food, type: :integer
            property :medication, type: :integer
            property :ammunition, type: :integer
          end
        end
      end
    end
  end
end
