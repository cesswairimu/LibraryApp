class Book < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  settings do
    mappings dynamic: false do
      indexes :user, type: :text
      indexes :title, type: :text, analyzer: :english
      indexes :author, type: :text
      indexes :publisher, type: :text
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
end
