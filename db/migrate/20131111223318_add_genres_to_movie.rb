class AddGenresToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :genres, :string, array: true, default: []
  end
end
