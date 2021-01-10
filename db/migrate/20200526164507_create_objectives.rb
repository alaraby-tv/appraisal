class CreateObjectives < ActiveRecord::Migration[5.2]
  def change
    create_table :objectives do |t|
      t.string :name
      t.references :section, foreign_key: true
      t.float :objective_percentage

      t.timestamps
    end
  end
end
