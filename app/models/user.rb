class User < ApplicationRecord
  has_and_belongs_to_many :tests, join_table: 'users_tests'

  def user_tests(test_level) end

end
