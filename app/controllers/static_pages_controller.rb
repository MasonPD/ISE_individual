class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @micropost  = current_user.microposts.build
      #@movie = current_user.movies.build
      #@movies = current_user.movies.all
      @feed_items = current_user.feed.paginate(page: params[:page])
      #@feed_items = current_user.feed(@movies).all
    end
  end

  def help
  end

  def about

  end
end
