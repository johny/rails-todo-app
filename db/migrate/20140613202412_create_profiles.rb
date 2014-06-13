class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|

      t.belongs_to :user

      t.integer :xp_points, default: 0
      t.integer :level, default: 1
      t.string :title, null: false

      t.timestamps
    end
  end
end
