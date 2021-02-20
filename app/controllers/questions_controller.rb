class QuestionsController < ApplicationController
  before_action :find_test, expect: [:destroy]
  before_action :find_question, only: [:show, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: "All questions: \n#{@test.questions.inspect}"
  end

  def show
    render plain: "Test: #{@test.title} \nQuestion: \n#{@question.inspect}"
  end

  def new
  end

  def create
    question = @test.questions.new(question_params)
    if question.save
      render plain: "Your question was successfully created: \n#{question.inspect}"
    else
      render plain: 'Invalid parameters.'
    end
  end

  def destroy
    @question.destroy
  end
  

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end
end
