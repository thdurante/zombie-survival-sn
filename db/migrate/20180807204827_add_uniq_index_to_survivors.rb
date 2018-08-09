class AddUniqIndexToSurvivors < ActiveRecord::Migration[5.2]
  def change
    add_index :survivors, %i(name gender), unique: true
  end
end
