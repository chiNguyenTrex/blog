class Article < ApplicationRecord
  has_many :comments, as: :commentable
  belongs_to :editor, class_name: User.name, foreign_key: :user_id

  delegate :name, to: :editor, prefix: true, allow_nil: true

  validates :title, presence: true
end
