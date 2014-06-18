class AddsGoldToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :amount_gold, :integer, after: :xp_points
  end
end
