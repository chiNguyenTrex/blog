class Project < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  #after_create {self.__elasticsearch__.index_document}
  #after_update {self.__elasticsearch__.index_document}

  belongs_to :project_manager, class_name: User.name, foreign_key: :user_id
  has_many :tasks

  delegate :name, to: :project_manager, prefix: true

  settings index: { number_of_shards: 1 } do
    mapping dynamic: false do
      indexes :name, analyzer: 'english'
      indexes :description, analyzer: 'english'
      indexes :project_manager_name, analyzer: 'english'
    end
  end

  def as_indexed_json options = {}
    self.as_json(
      methods: :project_manager_name,
      only: [:id, :name, :description],
      include: {
        project_manager: {
          only: [:name, :email]
        }
      }
    )
  end

  def self.search query
    __elasticsearch__.search(
      {
        query: {
          multi_match: {
            query: query,
            fields: ["name", "description", "project_manager.name", "project_manager.email"]
          }
        },
        highlight: {
          pre_tags: ["<b style='color: red'>"],
          post_tags: ['</b>'],
          fields: {
            name: {},
            description: {},
          }
        }
      }
    )
  end
end
