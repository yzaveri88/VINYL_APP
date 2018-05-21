class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.integer :year
      t.string :title
      t.string :artist
      t.string :label
      t.string :genre
      t.float :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
