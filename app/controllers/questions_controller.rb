class QuestionsController < ApplicationController
  before_action :find_test#, only: :index

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: "All questions: \n#{@test.questions.inspect}"
  end

  def show
    render plain: "Test: #{@test.title} \nQuestion: \n#{@test.questions.where(id: [params[:id]]).inspect}"
  end

  def new

  end

  def create
    question = @test.questions.create(question_params)
    render plain: question.inspect
  end

  def destroy
    Question.find(params[:id]).destroy
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end
end
