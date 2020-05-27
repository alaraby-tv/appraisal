class Section < ApplicationRecord
  before_save :add_total_percentage_to_the_group
  belongs_to :group, inverse_of: :sections
  has_many :objectives, inverse_of: :section, dependent: :destroy

  validates :name, :group, presence: true
  validate :total_group_percentage_cannot_be_greater_than_a_hundred

  private

  def add_total_percentage_to_the_group
    updated_group_percentage = group.total_group_percentage + section_percentage
    group.update_attribute(:total_group_percentage, updated_group_percentage)
  end

  def total_group_percentage_cannot_be_greater_than_a_hundred
    if group.total_group_percentage + section_percentage > 100.0
      errors.add(:section_percentage, "can't be more than #{100 - group.total_group_percentage.to_i}")
    end
  end
end
