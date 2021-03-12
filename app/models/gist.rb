class Gist < ApplicationRecord
  belongs_to :question
  belongs_to :user

  validates :question, presence: true
  validates :url, presence: true
  validates :email, presence: true
end
