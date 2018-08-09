class ItemSerializer < ActiveModel::Serializer
  attributes :id, :kind, :survivor_id

  def kind
    TradeItem.coerce(object.kind).try(:label)
  end
end
