class Objective < ApplicationRecord
  before_create :add_total_percentage_to_the_section
  belongs_to :section, inverse_of: :objectives
  has_many :evaluations, inverse_of: :objective, dependent: :destroy
  has_one :group, through: :section

  validates :name, :section, presence: true
  validate :total_section_percentage_cannot_be_greater_than_specified

  def add_total_percentage_to_the_section
    updated_section_percentage = section.total_section_percentage + objective_percentage
    section.update_attribute(:total_section_percentage, updated_section_percentage)
  end

  def total_section_percentage_cannot_be_greater_than_specified
    if section.total_section_percentage + objective_percentage > section.section_percentage
      errors.add(:objective_percentage, "can't be more than #{section.section_percentage - section.total_section_percentage}")
    end
  end
end
