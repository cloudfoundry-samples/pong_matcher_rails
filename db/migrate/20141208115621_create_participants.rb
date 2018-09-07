class CreateParticipants < ActiveRecord::Migration[5.0]
  def change
    create_table :participants do |t|
      t.string :match_uuid
      t.string :match_request_uuid
      t.string :player_uuid
      t.string :opponent_uuid

      t.timestamps
    end
  end
end
