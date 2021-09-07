class AnswerController < ApplicationController

  before_action :find_answer, only: %i[show destroy]
  before_action :find_question, only: %i[index create]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_answer_not_found

  #http://127.0.0.1:3000/questions/1/answer
  def index
  end

  #http://127.0.0.1:3000/answer/1
  def show
  end

  def new
    @answer = @question.answer.new
  end

  #http://127.0.0.1:3000/questions/1/answer/new
  def create
    new_answer = @question.answers.new(answer_params)
    if new_answer.save
      render plain: "Answer was create!"
    else
      render plain: "Error,try again or check process!"
    end
  end

  def update
  end

  def destroy
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def rescue_with_answer_not_found
    render plain: 'Answer was not found'
  end

end
