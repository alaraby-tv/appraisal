class Group < ApplicationRecord
  has_many :users, inverse_of: :group
  has_many :sections, inverse_of: :group, dependent: :destroy
end
