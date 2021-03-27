class BagesRule < ApplicationRecord
  has_many :bages_users, dependent: :destroy
  belongs_to :bage
  belongs_to :condition
end
