class TestPassage < ApplicationRecord

  SUCCESS_PERCENT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question",optional: true

  before_validation :before_validation_set_question, on: :create
  before_update :before_update_next_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def test_score
    ((correct_questions.to_f / test.questions.count).ceil(2) * 100).ceil
  end

  def result?
    test_score >= SUCCESS_PERCENT
  end

  def question_number
    test.questions.order(:id).where('id <= ?', current_question).count
  end

  private

  def before_validation_set_question
    self.current_question = test.questions.first if test.present?
  end

  def before_update_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct_answer
  end

end
