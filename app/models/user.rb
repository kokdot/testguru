class User < ApplicationRecord
  
  devise :database_authenticatable, 
          :registerable,
          :recoverable, 
          :rememberable, 
          :trackable,
          :validatable,
          :confirmable

  # include Auth

  has_many :test_passages
  has_many :gists
  has_many :tests, through: :test_passages
  has_many :author_tests, class_name: "Test", foreign_key: :user_id
  has_many :bages
  has_many :bage_users, dependent: :destroy
  has_many :bages, through: :bage_users

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def levels(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    self.class == Admin
  end
end
