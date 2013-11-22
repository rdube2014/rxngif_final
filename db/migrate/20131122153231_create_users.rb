class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, :default => "Anonymous"
      t.string :last_name, :default => "User"

      t.timestamps
    end
  end
end
