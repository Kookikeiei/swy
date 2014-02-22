class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :age
      t.string :birth_date
      t.string :personal_id
      t.string :address
      t.string :email
      t.string :rent
      t.string :room_no
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
