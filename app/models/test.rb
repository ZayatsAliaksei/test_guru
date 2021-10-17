class Test < ApplicationRecord

  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  has_many :questions
  belongs_to :category
  belongs_to :author, foreign_key: "user_id", class_name: 'User'

  scope :sort_tests, -> (category) { joins('INNER JOIN categories ON categories.id = tests.category_id')
                                                   .where(categories: { title: category })
                                                   .order(title: :desc) }

  scope :simple_tests, -> { where(level: 0..1) }
  scope :regular_tests, -> { where(level: 2..4) }
  scope :hard_tests, -> { where(level: 5..Float::INFINITY) }

  def self.sort_tests_by_category(category)
    sort_tests(category).pluck(:title)
  end

  validates :title,uniqueness: { scope: :level, message: "Test with the same title and lvl was create early" }
  validates :level, numericality: { only_integer: true, greater_than: 0}

end
