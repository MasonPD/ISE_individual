class CreateCircles < ActiveRecord::Migration
  def change
    create_table :circles do |t|
      t.integer :movie_id
      t.integer :user_id

      t.timestamps
    end
    add_index :circles, :movie_id
    add_index :circles, :user_id
    add_index :circles, [:movie_id, :user_id], unique: true
  end
end
