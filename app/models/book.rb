class Book < ApplicationRecord
  belongs_to :user
  belongs_to :genre

  delegate :name, :country, to: :user, prefix: true
  delegate :name, to: :genre, prefix: true
end
