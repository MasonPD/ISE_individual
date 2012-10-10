class AddMovieIdToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :movie_id, :integer
    add_index  :microposts, :movie_id
  end
end
