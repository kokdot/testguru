class Test < ApplicationRecord
  has_many :questions
  has_many :user_tests
  has_many :users, through: :user_tests, source: :user
  belongs_to :category
  belongs_to :author, foreign_key: "user_id" , class_name: "User"
  
  validates :title, presence: true
  validates :level, numericality: { only_integer: true }
  validates :title, uniqueness: { scope: :level }

  scope :easy_level, -> { where(level: 0..1).order(created_at: :desc) }
  scope :average_level, -> { where(level: 2..4).order(created_at: :desc) }
  scope :difficult_level, -> { where(level: 5..Float::INFINITY).order(created_at: :desc) }
  scope :categories, -> (category) { joins(:category).where("categories.title like ? ", category) }

  def self.categories_desc_title(category)
    categories(category).order(:title, :desc).pluck(:title)
  end
end
