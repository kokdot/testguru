class Test < ApplicationRecord
  has_many :questions
  has_many :user_tests
  has_many :users, through: :user_tests, source: :user
  belongs_to :category
  belongs_to :author, foreign_key: "user_id" , class_name: "User"

  def self.categories(category)
    joins(:category).where("categories.title like ? ", category).order(:title, :desc).pluck(:title)
  end
end
