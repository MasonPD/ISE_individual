class MoviesController < ApplicationController
  before_filter :signed_in_user,
                only: [:index, :joiners]

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(params[:movie])
    if @movie.save
      redirect_to @movie
    else
      render 'new'
    end
  end

  def index
    @movies = Movie.paginate(page: params[:page])
  end

  def show
    @movie = Movie.find(params[:id])
    @microposts = @movie.microposts.paginate(page: params[:page])
  end

  def joiners
    @title = "Joiners"
    @movie = Movie.find(params[:id])
    @users = @movie.users.paginate(page: params[:page])
    render 'show_joiners'
  end
end
