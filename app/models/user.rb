class User < ApplicationRecord
  has_many :user_tests
  has_many :tests, through: :user_tests
  has_many :author_tests, class_name: "Test"

  validates :email, presence: true

  def levels(level)
    tests.where(level: level)
  end
end
