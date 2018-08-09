class AddUniqIndexToItems < ActiveRecord::Migration[5.2]
  def change
    add_index :items, %i(survivor_id kind), unique: true
  end
end
