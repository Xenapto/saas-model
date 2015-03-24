class CreateSegmentFeatures < ActiveRecord::Migration
  def change
    create_table :segment_features do |t|
      t.references :segment, index: true
      t.references :feature, index: true
      t.float :obtainable_market
      t.float :obtainable_revenue

      t.timestamps null: false
    end
    add_foreign_key :segment_features, :segments
    add_foreign_key :segment_features, :features
  end
end
