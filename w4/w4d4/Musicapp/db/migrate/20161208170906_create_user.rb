class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null:false
      t.string :password_digest, null:false
      t.string :session_token, null:false

      t.timestamps
    end
    add_index :users, :email, name: "index_users_on_email", unique: true
    add_index :users, :session_token, name: "index_session_token_on_email", unique: true
  end
end
