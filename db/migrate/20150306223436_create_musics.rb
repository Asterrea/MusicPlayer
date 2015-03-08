class CreateMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.integer :name
      t.string :path
      t.integer :user_id
      t.integer :playlist_id

      t.timestamps null: false
    end
  end
end
