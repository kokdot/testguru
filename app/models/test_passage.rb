class TestPassage < ApplicationRecord
  SUCCESS_PERCENT = 85

  has_many :bages_users, dependent: :destroy
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, foreign_key: 'question_id', class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  after_validation :after_validation_next_question, on: :update, if: ->  { !completed? }

  scope :test_is_success, -> { where(success_test: true) }

  def self.test_attempt(test_id, user)
    test_is_success.where(user_id: user.id, test_id: test_id).count
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    if timer_is_over?
      update(current_question: nil)
    end
    if completed? && success?
      self.success_test = true
    end
    save
  end

  # def current_question?
  #   self.current_question != nil
  # end

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

  def timer_is_over?
    return false if test.timer == 0
    start_time = self.created_at.to_i
    end_time = Time.now.to_i
    delta_time = end_time - start_time
    test.timer -= delta_time if delta_time < test.timer
    delta_time > test.timer
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def after_validation_next_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    (correct_answers_count == correct_answers.where(id: answer_ids).count) && 
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct_answers
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
