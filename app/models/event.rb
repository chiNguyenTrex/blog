class Event < ApplicationRecord
  has_many :event_participations
  has_many :participants, through: :event_participations, source: :user

  has_many :comments, as: :commentable
end
