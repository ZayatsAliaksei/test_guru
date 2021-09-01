class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index]
  before_action :find_question, only: %i[show destroy create]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  #http://127.0.0.1:3000/tests/1/questions
  def index
     render inline: "<h1><b>Test:</b> <%= @test.title %></h1><p><%= @test.questions.each do |q| %> <p> <%= q.body %></p><% end %></p>"
  end
  #http://127.0.0.1:3000/questions/1
  def show
    # render inline: "<h1><b>Question:</b></h1><%= @question.body %>"
  end

  #  http://127.0.0.1:3000/tests/1/questions/new
  def create
    Question.create({:body=>params[:question][:body],:test_id=> params[:test_id]})
  end

  def destroy
    @question.destroy!
    redirect_to test_questions_path(@question.test_id)
  end

  def get_test_questions
    @test.find
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end

end
