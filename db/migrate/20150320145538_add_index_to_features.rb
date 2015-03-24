class AddIndexToFeatures < ActiveRecord::Migration
  def change
    change_column :features, :name, :string, null: false
    add_index :features, :name, unique: true
  end
end
