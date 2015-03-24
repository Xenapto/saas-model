class DenormalizeSegmentFeature < ActiveRecord::Migration
  def change
    add_column :segment_features, :segment_name, :string, null: false
    add_column :segment_features, :feature_name, :string, null: false
  end
end
