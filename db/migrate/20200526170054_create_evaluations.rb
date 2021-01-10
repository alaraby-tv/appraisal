class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.references :user, foreign_key: true
      t.references :objective, foreign_key: true
      t.float :calculated_score
      t.float :score

      t.timestamps
    end
  end
end
