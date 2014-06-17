class AddsGoldToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :amount_gold, :integer, default: 0, null: false, after: :title
  end
end
