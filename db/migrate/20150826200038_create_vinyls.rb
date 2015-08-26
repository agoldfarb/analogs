class CreateVinyls < ActiveRecord::Migration
  def change
    create_table :vinyls do |t|
      t.string :title
      t.string :artist
      t.string :year
      t.string :label

      t.timestamps null: false
    end
  end
end
