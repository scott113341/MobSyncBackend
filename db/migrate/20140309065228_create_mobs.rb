class CreateMobs < ActiveRecord::Migration
  def change
    create_table :mobs do |t|
      t.integer :user_id
      t.string :user_idz
      t.string :destination
      t.string :unix_timestamp

      t.timestamps
    end
  end
end
