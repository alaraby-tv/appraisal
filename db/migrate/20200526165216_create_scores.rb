class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.references :user, foreign_key: true
      t.references :objective, foreign_key: true
      t.float :calculated_score
      t.float :total

      t.timestamps
    end
  end
end
