class Evaluation < ApplicationRecord
  before_update :calculate_score
  belongs_to :user, inverse_of: :evaluations
  belongs_to :objective, inverse_of: :evaluations

  validates :score, inclusion: 1..10, on: :update


  def calculate_score
    calculated = score * objective.objective_percentage / 10
    self.calculated_score = calculated
  end
end
