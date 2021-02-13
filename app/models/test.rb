class Test < ApplicationRecord
  has_many :user_tests
  has_many :users, through: :user_tests
  belongs_to :category

  def self.categories(category)
    joins(:category).where("categories.title like ? ", category).order(:title, :desc).pluck(:title)
  end
end
