class CreateSegments < ActiveRecord::Migration
  def change
    create_table :segments do |t|
      t.string :name
      t.integer :addressable_market
      t.float :market_expansion
      t.float :awareness_coefficient
      t.float :adoption_coefficient
      t.float :adoption_peak
      t.float :conversion_uc
      t.float :conversion_ua
      t.float :conversion_ca
      t.float :stickiness
      t.integer :available_revenue

      t.timestamps null: false
    end
  end
end
