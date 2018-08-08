class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :survivor, foreign_key: true
      t.string :kind, null: false
      t.integer :amount, null: false, default: 0

      t.timestamps
    end
  end
end
