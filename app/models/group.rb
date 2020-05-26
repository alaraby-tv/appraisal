class Group < ApplicationRecord
  has_many :sections, inverse_of: :groups
end
