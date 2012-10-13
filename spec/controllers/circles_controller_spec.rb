require 'spec_helper'

describe CirclesController do
  let(:user) { FactoryGirl.create(:user) }
  let(:movie) { FactoryGirl.create(:movie) }

  before { sign_in user }

  describe "creating a relationship with Ajax" do

    it "should increment the Relationship count" do
      expect do
        xhr :post, :create, circle: { movie_id: movie.id }
      end.to change(Circle, :count).by(1)
    end

    it "should respond with success" do
      xhr :post, :create, circle: { movie_id: movie.id }
      response.should be_success
    end

  end

  describe "destroying a relationship with Ajax" do

    before { user.join!(movie) }
    let(:circle) { user.circles.find_by_movie_id(movie) }

    it "should decrement the Relationship count" do
      expect do
        xhr :delete, :destroy, id: circle.id
      end.to change(Circle, :count).by(-1)
    end

    it "should respond with success" do
      xhr :delete, :destroy, id: circle.id
      response.should be_success
    end
  end
end
