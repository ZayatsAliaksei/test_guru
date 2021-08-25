class Test < ApplicationRecord
  has_and_belongs_to_many :users, join_table: 'users_tests'
  has_many :questions
  belongs_to :category
  belongs_to :author,foreign_key: "user_id", class_name: 'User'

  def sort_tests_by_category(category)
    Test.joins('INNER JOIN categories ON categories.id = tests.category_id')
        .where("categories.title = #{category}").order(title: :desc)
        .pluck(:title)
  end
end
