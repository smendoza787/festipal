class CreateFestivals < ActiveRecord::Migration[5.1]
  def change
    create_table :festivals do |t|
      t.string :name
      t.date :date
      t.string :location
      t.integer :created_by_user_id
    end
  end
end
