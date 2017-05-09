class CreateFestivalUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :festival_users do |t|
      t.integer :user_id
      t.integer :festival_id
    end
  end
end
