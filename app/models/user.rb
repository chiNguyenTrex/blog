class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable

  has_one :address

  has_many :books, dependent: :destroy
  has_many :genres, through: :books

  has_many :articles, dependent: :destroy

  has_many :event_participations
  has_many :events, through: :event_participations

  has_many :comments

  delegate :street, :city, to: :address
end