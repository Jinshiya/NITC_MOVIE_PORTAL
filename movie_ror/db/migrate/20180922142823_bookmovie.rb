class Bookmovie < ActiveRecord::Migration[5.2]
  def change
  	add_foreign_key :uname
  end
end
