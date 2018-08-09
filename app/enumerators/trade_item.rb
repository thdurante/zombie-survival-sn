class TradeItem
  include EnumeratedTypeWithBenefits

  declare :water,      cost: 4
  declare :food,       cost: 3
  declare :medication, cost: 2
  declare :ammunition, cost: 1
end
