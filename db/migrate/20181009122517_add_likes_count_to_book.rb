class AddLikesCountToBook < ActiveRecord::Migration[5.2]
  def change
  	add_column :books, :favorite_count,  :integer
  end
end
