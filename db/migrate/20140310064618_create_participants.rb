class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.integer :mob_id
      t.integer :user_id
      t.integer :status

      t.timestamps
    end
  end
end
