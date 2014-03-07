class CreateRepairs < ActiveRecord::Migration
  def change
    create_table :repairs do |t|
      t.string :room_no
      t.string :name
      t.string :problem

      t.timestamps
    end
  end
end
