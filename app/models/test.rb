class Test < ApplicationRecord

  has_and_belongs_to_many :users, join_table: 'users_tests'
  has_many :questions
  belongs_to :category
  belongs_to :author, foreign_key: "user_id", class_name: 'User'


  scope :sort_tests_by_category, -> (category) { joins(:category)
                                                   .where(categories: { title: category })
                                                   .order(title: :desc) }

  scope :simple_tests, -> { where(level: 0..1) }
  scope :regular_tests, -> { where(level: 2..4) }
  scope :hard_tests, -> { where(level: 5..Float::INFINITY) }

  validates :title,uniqueness: { scope: :level, message: "Test with the same title and lvl was create early" }
  validates :level, numericality: { only_integer: true, greater_than: 0}

end
