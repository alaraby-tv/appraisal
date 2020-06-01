class User < ApplicationRecord
  after_save :set_objectives
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :group, inverse_of: :users, optional: true
  has_many :evaluations, inverse_of: :user, dependent: :destroy
  has_many :objectives, through: :evaluations, inverse_of: :users

  def name
    "#{first_name} #{last_name}"
  end

  private

  def set_objectives
    if group
      unless objectives.ids.sort == group.objectives.ids.sort
        evaluations.each {|e| e.destroy}
        group.objectives.each do |objective|
          evaluations.create(objective: objective)
        end
      end
    end
  end
end
