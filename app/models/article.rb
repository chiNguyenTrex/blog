class Article < ApplicationRecord
  has_many :comments, as: :commentable
  validates :title, presence: true, length:{minimum: 5, maximum: 10}
end
