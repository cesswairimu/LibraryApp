class Book < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  settings do
    mappings dynamic: false do
      indexes :user, type: :text
      indexes :title, type: :text, analyzer: :english
      indexes :author, type: :text
      indexes :publisher, type: :text
      indexes :quantity, type: :integer
  end
  end

  has_many :users
  has_many :bids
  default_scope -> { order(id: :asc)  }
  validates :title, presence: true
  validates :author, presence: true
  validates :publisher, presence: true
  validates :quantity, presence: true, numericality: true
  validates :category, presence: true

  def release
    decrement(:quantity, 1)
  end

  def return
    increment(:quantity, 1)
  end

  def self.search_available(query)
    self.search({
      query: {
        bool: {
          must: [
            {
              multi_match: {
                query: query,
                fields: [:title, :author, :publisher, :category]
              }
            },
            {
              range: {
                quantity: {
                  gte: 1
                }
              }
            }
          ]
        }
      }
    })
  end


end
