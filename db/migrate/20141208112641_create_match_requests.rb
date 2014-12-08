class CreateMatchRequests < ActiveRecord::Migration
  def change
    create_table :match_requests do |t|
      t.string :uuid
      t.string :player_uuid

      t.timestamps
    end
  end
end
