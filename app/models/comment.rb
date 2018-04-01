class Comment < ApplicationRecord
  resourcify
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  delegate :name, to: :user, prefix: true
end
