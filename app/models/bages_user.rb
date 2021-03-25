class BagesUser < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :bages_rule
end
