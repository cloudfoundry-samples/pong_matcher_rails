class CreateMatchRequests < ActiveRecord::Migration
  def change
    create_table :match_requests do |t|
      t.string :uuid
      t.string :player

      t.timestamps
    end
  end
end
