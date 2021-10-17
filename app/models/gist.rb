class Gist < ApplicationRecord
  belongs_to :question
  belongs_to :user

  def get_hash
    self.url[/(?<=\.com\/).*$/]
  end

  def question_body
    self.question.body.truncate(24)
  end

end
