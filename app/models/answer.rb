class Answer < ApplicationRecord
  belongs_to :question

  scope :correct_answer, -> { where(correct: true) }

  validates :body, presence: true
  validate :number_of_questions

  private

  def number_of_questions
    # errors.add( "there should be from 1 to 4 answers") if question.answers.size >= 4
  end

end
