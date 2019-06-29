class CreateUsergroups < ActiveRecord::Migration[5.2]
  def change
    create_table :usergroups do |t|
      t.string :uname
      t.string :gname
      t.string :status

      t.timestamps
    end
  end
end
