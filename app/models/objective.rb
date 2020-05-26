class Objective < ApplicationRecord
  belongs_to :section, inverse_of: :objectives
  has_many :evaluations, inverse_of: :objective, dependent: :destroy
end
