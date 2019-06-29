class CreateBookmovies < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmovies do |t|
      t.string :mname
      t.string :uname

      t.timestamps
    end
    #add_foreign_key :uname
  end
end
