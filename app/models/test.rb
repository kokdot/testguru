class Test < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages#, source: :user
  
  belongs_to :category
  belongs_to :author, foreign_key: "user_id" , class_name: "User", optional: true
  
  validates :title, presence: true
  validates :level, numericality: { only_integer: true }
  validates :title, uniqueness: { scope: :level }

  scope :easy_level, -> { where(level: 0..1).order(created_at: :desc) }
  scope :average_level, -> { where(level: 2..4).order(created_at: :desc) }
  scope :difficult_level, -> { where(level: 5..Float::INFINITY).order(created_at: :desc) }
  scope :categories, -> (category) { joins(:category).where("categories.title like ? ", category) }
  scope :levels, -> (level) { where(level: level).pluck(:id) }

  def self.categories_desc_title(category)
    categories(category).order(:title, :desc).pluck(:title)
  end
end
