class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @micropost  = current_user.microposts.build
      @movie = current_user.movies.build
      @feed_items = current_user.feed(@movie).paginate(page: params[:page])
    end
  end

  def help
  end

  def about

  end
end
