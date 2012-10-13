# == Schema Information
#
# Table name: circles
#
#  id         :integer          not null, primary key
#  movie_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Circle < ActiveRecord::Base
  attr_accessible :movie_id, :user_id

  belongs_to :movie, class_name: "Movie"
  belongs_to :user, class_name: "User"

  validates :movie_id, presence: true
  validates :user_id, presence: true
end
