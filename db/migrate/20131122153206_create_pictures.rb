class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :image_url, :default => "http://upload.wikimedia.org/wikipedia/commons/9/92/Image_of_nothing.svg"
      t.string :caption
      t.integer :user_id

      t.timestamps
    end
  end
end
