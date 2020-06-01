class Objective < ApplicationRecord
  before_save :update_total_percentage_of_the_section
  belongs_to :section, inverse_of: :objectives
  has_many :evaluations, inverse_of: :objective, dependent: :destroy
  has_many :users, through: :evaluations, inverse_of: :objectives
  has_one :group, through: :section

  validates :name, :section, presence: true
  validates_uniqueness_of :name, scope: :section
  validate :total_section_percentage_cannot_be_greater_than_specified

  private

  def new_percentage
    previous_objective_percentage = objective_percentage_was == nil ? 0.0 : objective_percentage_was
    new_objective_percentage = objective_percentage - previous_objective_percentage
  end

  def update_total_percentage_of_the_section
    updated_section_percentage = section.total_section_percentage + new_percentage
    section.update_attribute(:total_section_percentage, updated_section_percentage)
  end

  def total_section_percentage_cannot_be_greater_than_specified
    if section.total_section_percentage + new_percentage > section.section_percentage
      errors.add(:objective_percentage, "exceeds allowed section total percentage (#{section.section_percentage}%)")
    end
  end
end
