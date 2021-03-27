class BagesUser < ApplicationRecord
  belongs_to :test_passage
  belongs_to :bages_rule
  scope :bages_user, -> (user) { where(test_passage_id: TestPassage.where(user_id: user.id)) }
end
