class User < ApplicationRecord
  has_and_belongs_to_many :tests, join_table: 'users_tests'
  has_many :tests

  def user_tests(test_level)
    self.tests.where(level: test_level)
  end

end
