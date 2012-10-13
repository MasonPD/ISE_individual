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

require 'spec_helper'

describe Circle do
  let(:user) { FactoryGirl.create(:user) }
  let(:movie) { FactoryGirl.create(:movie) }
  let(:circle) { user.circles.build(movie_id: movie.id) }

  subject { circle }

  it { should be_valid }
end
