# == Schema Information
#
# Table name: microposts
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  movie_id   :integer
#

class Micropost < ActiveRecord::Base
  attr_accessible :content, :movie_id
  belongs_to :user
  belongs_to :movie

  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  validates :movie_id, presence: true
  default_scope order: 'microposts.created_at DESC'

  def self.from_movies_joiner_by(user)
    #     movie_joiners_ids = "SELECT user_id FROM circles
    #                      WHERE movie_id = :movie_id"
    # where("user_id IN (#{movie_joiners_ids}) OR user_id = :user_id",
    #      user_id: user.id, movie_id: movie.id)
    movie_joiners_ids = "SELECT movie_id FROM circles WHERE user_id = :user_id"
    where("movie_id In (#{movie_joiners_ids})", user_id: user.id)
  end
end
