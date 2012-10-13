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

require 'spec_helper'

describe Movie do
  before do
    @movie = Movie.new(name: "Example Movie", url: "www.youtube.com/example")
  end

  subject { @movie }

  it { should respond_to(:name) }
  it { should respond_to(:url) }
  it { should respond_to(:microposts) }
  it { should respond_to(:circles) }
  it { should respond_to(:users) }


  it { should be_valid }
end
