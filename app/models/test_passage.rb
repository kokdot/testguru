class TestPassage < ApplicationRecord
  SUCCESS_PERCENT = 85

  has_many :bages_users, dependent: :destroy
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, foreign_key: 'question_id', class_name: 'Question', optional: true

  # scope :levels_user, -> (level) { where(test_success: true, user_id: current_user, test_id: Test.levels(level)).pluck(:test_id).uniq }
  # scope :categories_user, -> (category) { where(test_success: true, user_id: current_user, test_id: Test.categories(category)).pluck(:test_id).uniq }
  # scope :test_attempt, -> (test_id, user) { where(test_success: true, user_id: user.id, test_id: test_id) }

  before_validation :before_validation_set_first_question, on: :create
  after_validation :after_validation_next_question, on: :update

  def self.test_attempt(test_id, user)
    where(test_success: true, user_id: user.id, test_id: test_id).count
  end

  def self.levels_user(level, user)
    joins(:test).where(test_success: true, user_id: user.id, test: { level: level }).pluck(:test_id).uniq
  end

  def self.categories_user(category, user)
    joins(:category).where(test_success: true, user_id: user.id, category: { title: category }).pluck(:test_id).uniq
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    if completed? && success?
      self.success_test = true
    end
    save!
  end

  def first_attempt?
    Test.where(id: test_id).count == 1
  end

  def completed?
    current_question.nil?
  end

  def success?
    result > SUCCESS_PERCENT

  end

  def result
    correct_questions / test.questions.count * 100
  end

  def number_of_questions
    test.questions.order(id: :asc).where('id < ?', question_id).count + 1
  end


  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def after_validation_next_question
    self.current_question = next_question
    # if completed? && success?
    #   # self.success_test = true
    #   # save!
    #   update(success_test: true)
    # end
  end

  # def after_validation_next_question
  #   self.current_question = next_question
  #   # save
  # end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    (correct_answers_count == correct_answers.where(id: answer_ids).count) && 
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct_answers
  end

  def next_question
    p "next_question!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
