class Circle < ActiveRecord::Base
  attr_accessible :movie_id, :user_id

  belongs_to :movie, class_name: "Movie"
  belongs_to :user, class_name: "User"

  validates :movie_id, presence: true
  validates :user_id, presence: true
end
