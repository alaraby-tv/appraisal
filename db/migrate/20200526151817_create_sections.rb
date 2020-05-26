class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.string :name
      t.references :group, foreign_key: true
      t.float :precentage
      t.float :total_percentage

      t.timestamps
    end
  end
end
