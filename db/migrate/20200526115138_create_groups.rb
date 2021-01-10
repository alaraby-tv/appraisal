class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.float :total_group_percentage, default: 0.0

      t.timestamps
    end
  end
end
