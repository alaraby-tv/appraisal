class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.float :total_percentage

      t.timestamps
    end
  end
end
