class CreateDescriptions < ActiveRecord::Migration
  def change
    create_table :descriptions do |t|
      t.integer :described_user_id
      t.integer :described_by_user_id
      t.string :content

      t.timestamps
    end
  end
end
