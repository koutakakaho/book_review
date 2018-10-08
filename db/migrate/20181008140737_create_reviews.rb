class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|

      t.timestamps
      t.text	:editor
      t.text	:review
      t.integer :rank
      t.integer :book_id
      t.integer :user_id
    end
  end
end
