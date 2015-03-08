class EditTypeOfNameFromMusic < ActiveRecord::Migration
  def change
  	remove_column :musics, :name
  	add_column :musics, :name, :string
  end
end
