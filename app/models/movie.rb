# == Schema Information
#
# Table name: movies
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  url        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Movie < ActiveRecord::Base
  attr_accessible :name, :url
  has_many :microposts, dependent: :destroy
  has_many :circles, foreign_key: "movie_id", dependent: :destroy
  has_many :users, through: :circles, source: :user

  validates :name, presence: true, length: { maximum: 50 }
  validates :url, presence: true, length: { maximum: 250 }

  default_scope order: 'movies.created_at DESC'
end
