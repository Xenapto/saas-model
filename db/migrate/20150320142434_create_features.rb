class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :name
      t.integer :effort
      t.date :development_start
      t.float :development_headcount
      t.date :release_date
      t.integer :development_periods

      t.timestamps null: false
    end
  end
end
