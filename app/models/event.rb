class Event < ApplicationRecord
  resourcify
  include Commentable

  has_many :event_participations
  has_many :participants, through: :event_participations, source: :user

  validates :name, presence: true
end
