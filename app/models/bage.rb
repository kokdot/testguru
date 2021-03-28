class Bage < ApplicationRecord
  has_many :bages_rules, dependent: :destroy
  belongs_to :user, optional: true
  def bage_of_user?(user)
    user.id == user.id
  end
end
