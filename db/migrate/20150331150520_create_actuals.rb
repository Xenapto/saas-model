class CreateActuals < ActiveRecord::Migration
  def change
    create_table :actuals do |t|
      t.date :period
      t.decimal :costs, precision: 16, scale: 2
      t.decimal :revenue, precision: 16, scale: 2
      t.decimal :capital_introduced, precision: 16, scale: 2
      t.string :capital_note

      t.timestamps null: false
    end
  end
end
