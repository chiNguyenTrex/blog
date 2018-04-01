class Article < ApplicationRecord
  resourcify
  include Commentable
  belongs_to :editor, class_name: User.name, foreign_key: :user_id

  delegate :name, to: :editor, prefix: true, allow_nil: true

  validates :title, presence: true
end
