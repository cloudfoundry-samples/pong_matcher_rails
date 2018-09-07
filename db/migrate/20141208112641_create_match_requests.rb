class CreateMatchRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :match_requests do |t|
      t.string :uuid
      t.string :player_uuid

      t.timestamps
    end
  end
end
