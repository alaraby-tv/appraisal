class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.string :name
      t.references :group, foreign_key: true
      t.float :section_percentage
      t.float :total_section_percentage, default: 0.0

      t.timestamps
    end
  end
end
