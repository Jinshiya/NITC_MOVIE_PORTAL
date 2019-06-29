class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :mname
      t.string :mtype
      t.string :lang
      t.string :picture

      t.timestamps
    end
  end
end
