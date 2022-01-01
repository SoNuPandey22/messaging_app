class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      #digest helps to work secure password
      t.string :password_digest 
      t.timestamps
    end
  end
end
