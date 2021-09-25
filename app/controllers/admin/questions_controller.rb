class Admin::QuestionsController < Admin::BaseController

  before_action :find_question, only: [:show, :edit, :update, :destroy]
  before_action :find_test, only: [:update, :edit, :create, :new]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  #http://127.0.0.1:3000/questions/1
  def show
  end

  def new
    @question = @test.questions.new
  end

  #  http://127.0.0.1:3000/tests/1/questions/new
  def create
    new_question = @test.questions.new(question_params)
    if new_question.save
      redirect_to root_path
    else
      render plain: "Error,try again or check process!"
    end
  end

  def edit

  end

   def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :new
    end
  end

  def destroy
    @question.destroy!
    redirect_to admin_test_questions_path(@question.test_id)
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: t('helpers.test.warning')
  end

end
