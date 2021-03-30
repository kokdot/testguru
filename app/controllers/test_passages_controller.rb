class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result gist]

  def show
  end
  
  def result
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      if @test_passage.success?
        @test_passage.update(success_test: true)
        bage_service = BageService.new(@test_passage)
        bage_service.call
      end
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    @question = @test_passage.current_question
    gist = GistQuestionService.new(@question)
    result = gist.call
    if gist.success?
      @question.gists.create(url: result[:html_url], user_id: current_user.id)
      flash_options = { notice: t('.success') + "  #{ helpers.link_to( 'gist', result[:html_url], html_options: { target: '_blank' }) }" }
    else
      flash_options = { alert: t('.failure') }
    end
    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
