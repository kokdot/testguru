class Bage < ApplicationRecord
  has_many :bages_rules, dependent: :destroy
  has_many :bage_users, dependent: :destroy
  has_many :users, through: :bage_users
  def bage_of_user?(owner)
    user.id == owner.id
  end
end
