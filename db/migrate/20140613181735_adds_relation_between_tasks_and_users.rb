class AddsRelationBetweenTasksAndUsers < ActiveRecord::Migration
  def change
    add_column :tasks, :user_id, :integer, after: :done
  end
end
