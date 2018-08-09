class RemoveIndexFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_index :items, name: 'index_items_on_survivor_id_and_kind'
  end
end
