class AddsXpToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :xp_points, :integer, after: :done
  end
end
