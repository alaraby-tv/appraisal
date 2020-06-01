class Section < ApplicationRecord
  before_save :update_total_percentage_of_the_group
  belongs_to :group, inverse_of: :sections
  has_many :objectives, inverse_of: :section, dependent: :destroy

  validates :name, :group, presence: true
  validates_uniqueness_of :name, scope: :group
  validate :total_group_percentage_cannot_be_greater_than_a_hundred
  validate :section_percentage_cannot_be_lower_than_total_percentage

  private

  def new_percentage
    previous_section_percentage = section_percentage_was == nil ? 0.0 : section_percentage_was
    new_section_percentage = section_percentage - previous_section_percentage
  end

  def update_total_percentage_of_the_group
    updated_group_percentage = group.total_group_percentage + new_percentage
    group.update_attribute(:total_group_percentage, updated_group_percentage)
  end

  def total_group_percentage_cannot_be_greater_than_a_hundred
    if group.total_group_percentage + new_percentage > 100
      errors.add(:section_percentage, "exceeds allowed total group percentage (100.0%)")
    end
  end

  def section_percentage_cannot_be_lower_than_total_percentage
    if section_percentage < total_section_percentage
      errors.add(:section_percentage, "can't be lower than total percentage of its objectives (#{total_section_percentage}%)")
    end
  end
end
