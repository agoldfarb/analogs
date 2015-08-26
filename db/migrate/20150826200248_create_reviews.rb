class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :body
      t.references :vinyl, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
