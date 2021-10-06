class Admin::AnswersController < Admin::BaseController

  before_action :find_answer, only: [:show, :edit,:update, :destroy]
  before_action :find_question, only: [:index, :create, :new]
  # rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_answer_not_found

  #http://127.0.0.1:3000/questions/1/answer
  def index
  end

  #http://127.0.0.1:3000/answer/1
  def show
  end

  def new
    @answer = @question.answers.new
  end

  #http://127.0.0.1:3000/questions/1/answer/new
  def create
    new_answer = @question.answers.new(answer_params)
    if new_answer.save
      redirect_to admin_question_path(@question)
    else
      render plain: "Error,try again or check process!"
    end
  end

  def edit

  end

  def update
    if @answer.update(answer_params)
      redirect_to admin_question_path(@answer.question)
    else
      render :new
    end
  end

  def destroy
    @answer.destroy!
    redirect_to admin_question_path(@answer.question)
  end

  private

  def answer_params
    params.require(:answer).permit(:body,:correct )
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def rescue_with_answer_not_found
    render plain: t('helpers.test.warning')
  end

end
