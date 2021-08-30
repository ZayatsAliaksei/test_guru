class TestsController < ApplicationController

  def index
    @tests = Test.all
  end

  def  test_questions_list(test)

  end

end
