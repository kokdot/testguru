class Test < ApplicationRecord
  has_many :user_tests
  has_many :users, :through => :user_tests

  def self.cats(cat)
    where(category_id: Category.where(title: cat)).order(:title, :desc).pluck(:title)
  end
end
