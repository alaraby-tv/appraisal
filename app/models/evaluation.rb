class Evaluation < ApplicationRecord
  belongs_to :user, inverse_of: :evaluations
  belongs_to :objective, inverse_of: :evaluations
end
