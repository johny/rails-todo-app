class AddsRelationBetweenProjectsAndTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :project_id, :integer, after: :user_id
  end
end
