class MatchRequest < ActiveRecord::Base
  def as_json(*)
    {
      id: uuid,
      player: player,
      match_id: nil
    }
  end
end
