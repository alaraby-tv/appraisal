class Section < ApplicationRecord
  belongs_to :group, inverse_of: :sections
  has_many :objectives, inverse_of: :section, dependent: :destroy
end
