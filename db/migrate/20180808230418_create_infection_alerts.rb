class CreateInfectionAlerts < ActiveRecord::Migration[5.2]
  def change
    create_table :infection_alerts do |t|
      t.references :infected_survivor, index: true, foreign_key: { to_table: :survivors }
      t.references :author, index: true, foreign_key: { to_table: :survivors }

      t.timestamps
    end
  end
end
