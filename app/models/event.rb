class Event < ApplicationRecord
  resourcify
  include Commentable

  has_many :event_participations
  has_many :participants, through: :event_participations, source: :user

  validates :name, presence: true

  scope :search_by_term, ->(term){where "name LIKE ?", "%#{term}%"}
end
