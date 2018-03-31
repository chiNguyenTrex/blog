class Event < ApplicationRecord
  #has_many :comments, as: :commentable  Alternative by:
  include Commentable

  has_many :event_participations
  has_many :participants, through: :event_participations, source: :user

  validates :name, presence: true
end
