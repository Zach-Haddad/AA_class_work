class CreateVisit < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :shortened_urls_id
      t.integer :user_id

      t.timestamps
    end
  end
end
