class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.string :title
      t.text :author
      t.string :edition
      t.string :isbn
      t.string :cover
      t.text :description
      t.decimal :price, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end
