class ChangeDateColumn < ActiveRecord::Migration[5.1]
  def change
    change_column :festivals, :date, :date
  end
end
