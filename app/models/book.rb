class Book < ApplicationRecord
  #has_many :comments, as: :commentable  Alternative by:
  include Commentable

  belongs_to :author, class_name: User.name, foreign_key: :user_id
  belongs_to :genre

  delegate :name, to: :author, prefix: true
  delegate :name, to: :genre, prefix: true

  validates :name, presence: true
end
