class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test_passage, only: %i[ show update result gist]

  def show
  end

  def update
    @test_passage.accept!(params.dig( :answer_ids))
    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def result

  end

  def gist
    gist = GistQuestionService.new(@test_passage.current_question)
    result = gist.call

    flash = if gist.success?
              current_user.gists.create(question: @test_passage.current_question, url: result.html_url)
              {notice: t('gists.positive', url: result.html_url)}
            else
              {notice: t('gists.negative')}
            end
    redirect_to @test_passage, flash
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
