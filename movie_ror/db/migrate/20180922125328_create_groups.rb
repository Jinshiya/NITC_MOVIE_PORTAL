class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :gname
      t.string :admin

      t.timestamps
    end
    #add_foreign_key :admin
  end
end
