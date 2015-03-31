class ChangeCurrenciesToDecimal < ActiveRecord::Migration
  def change
    change_column :segments, :available_revenue, :decimal, :precision => 16, :scale => 2
    change_column :segment_features, :obtainable_revenue, :decimal, :precision => 16, :scale => 2
  end
end
