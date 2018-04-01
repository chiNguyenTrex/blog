class Genre < ApplicationRecord
  resourcify
  has_many :books, dependent: :destroy
  has_many :users, through: :books

  validates :name, presence: true
end
