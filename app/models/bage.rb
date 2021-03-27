class Bage < ApplicationRecord
  has_many :bages_rules, dependent: :destroy
end
