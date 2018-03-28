class Article < ApplicationRecord
  validates :title, presence: true, length:{minimum: 5, maximum: 10}
end
