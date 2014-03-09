class CreateMobs < ActiveRecord::Migration
  def change
    create_table :mobs do |t|
      t.string :user_ids

      t.timestamps
    end
  end
end
