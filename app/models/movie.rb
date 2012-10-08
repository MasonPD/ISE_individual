class Movie < ActiveRecord::Base
  attr_accessible :name, :url
  has_many :circles, foreign_key: "movie_id", dependent: :destroy
  has_many :users, through: :circles, source: :user

  validates :name, presence: true, length: { maximum: 50 }
  validates :url, presence: true, length: { maximum: 250 }

  default_scope order: 'movies.created_at DESC'
end
