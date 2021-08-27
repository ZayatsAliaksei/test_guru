class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validate :body, presence: true
  # validates :answers, length: { minimum: 1, maximum: 4 } -- такой вариант может быть использован??
  validate :number_of_answers

  def number_of_answers
    errors.add(:answers, "there should be from 1 to 4 answers") if answers.size > 4 || answers.size < 1
  end

end
