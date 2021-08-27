class Category < ApplicationRecord
  has_many :tests

  default_scope { order('title') }

  validate :title, presence: true
end
