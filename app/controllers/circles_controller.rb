class CirclesController < ApplicationController
  before_filter :signed_in_user

  def create
    @movie = Movie.find(params[:circle][:movie_id])
    current_user.join!(@movie)
    respond_to do |format|
      format.html { redirect_to @movie }
      format.js
    end
  end

  def destroy
    @movie = Circle.find(params[:id]).movie
    current_user.unjoin!(@movie)
    respond_to do |format|
      format.html { redirect_to @movie }
      format.js
    end
  end
end
