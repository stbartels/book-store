class AddcopyRightYearTObook < ActiveRecord::Migration
  def self.up
    add_column :books, :copy_right_year, :string
  end

  def self.down
    remove_column :books, :copy_right_year
  end
end