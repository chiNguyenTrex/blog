class Book < ApplicationRecord
  belongs_to :author, class_name: User.name, foreign_key: :user_id
  belongs_to :genre

  has_many :comments, as: :commentable

  delegate :name, :country, to: :author, prefix: true
  delegate :name, to: :genre, prefix: true
end
