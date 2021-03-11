class Gist < ApplicationRecord
  validates :question, presence: true
  validates :url, presence: true
  validates :email, presence: true
end
