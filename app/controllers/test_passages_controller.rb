class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result gist]

  def show
  end
  
  def result
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    # byebug
    if result.url.present?
      Gist.create(question: @test_passage.current_question.body.truncate(25), url: result[:html_url], email: current_user.email)
    end
    flash_options = if result.url
      { notice: t('.success') + "  #{ helpers.link_to( 'gist', result[:html_url], html_options: { target: '_blank' }) }" }
    else
      { alert: t('.failure') }
    end
    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
