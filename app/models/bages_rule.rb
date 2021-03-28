class BagesRule < ApplicationRecord
  has_many :rule_tests, dependent: :destroy
  belongs_to :bage
end
