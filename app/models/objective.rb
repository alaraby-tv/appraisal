class Objective < ApplicationRecord
  belongs_to :section, inverse_of: :objective
end
