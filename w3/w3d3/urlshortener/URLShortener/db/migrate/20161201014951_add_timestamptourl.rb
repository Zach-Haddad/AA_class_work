class AddTimestamptourl < ActiveRecord::Migration
  def change
    add_timestamps :shortened_urls do |t|
      t.timestamps
    end
  end
end
