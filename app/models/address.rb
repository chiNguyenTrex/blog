class Address < ApplicationRecord
  resourcify
  belongs_to :person, class_name: User.name, foreign_key: :user_id
  delegate :name, to: :person, prefix: true
end
