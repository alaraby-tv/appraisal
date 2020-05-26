class Group < ApplicationRecord
  has_many :sections, inverse_of: :group, dependent: :destroy
end
