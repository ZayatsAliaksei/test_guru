class Test < ApplicationRecord
  has_and_belongs_to_many :users, join_table: 'users_tests'

  def sort_tests_by_category(category)
    Test.joins('INNER JOIN categories ON categories.id = tests.category_id')
        .where("categories.title = #{category}").order(title: :desc)
        .pluck(:title)
  end
end
