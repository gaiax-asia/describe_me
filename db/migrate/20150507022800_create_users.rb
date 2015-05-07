class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fb_id
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :gender
      t.string :link
      t.string :username

      t.timestamps
    end
  end
end
