class Project < ApplicationRecord
  belongs_to :project_manager, class_name: User.name, foreign_key: :user_id
  has_many :tasks

  delegate :name, to: :project_manager, prefix: true
end
