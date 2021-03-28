class Bage < ApplicationRecord
  has_many :bages_rules, dependent: :destroy
  belongs_to :user, optional: true
  def bage?(user)
    self.user.id == user.id
  end
end
