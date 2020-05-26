class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :group, inverse_of: :users, optional: true
  has_many :evaluations, inverse_of: :user, dependent: :destroy

  def name
    "#{first_name} #{last_name}"
  end
end
