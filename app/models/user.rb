require 'digest/sha1'

class User < ApplicationRecord

  # include Auth

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :author_tests, class_name: "Test", foreign_key: :user_id

  has_secure_password

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def levels(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  
end
