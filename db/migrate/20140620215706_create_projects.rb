class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.text :description
      t.datetime :due_date
      t.boolean :completed, null: false, default: false
      t.belongs_to :user
      t.timestamps
    end
  end
end
