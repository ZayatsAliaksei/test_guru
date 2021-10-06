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

  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
