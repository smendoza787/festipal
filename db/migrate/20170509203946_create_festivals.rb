class CreateFestivals < ActiveRecord::Migration[5.1]
  def change
    create_table :festivals do |t|
      t.string :name
      t.string :date
      t.string :location
    end
  end
end
