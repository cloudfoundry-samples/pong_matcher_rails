class MatchRequest < ActiveRecord::Base

  before_create :persist_participants

  def match_uuid
    participant = Participant.where(match_request_uuid: uuid).first
    participant.match_uuid if participant
  end

  def as_json(*)
    {
      id: uuid,
      player: player_uuid,
      match_id: match_uuid
    }
  end

  private

  def persist_participants
    opponent_request = find_opponent_request

    if opponent_request
      match_uuid = SecureRandom.uuid
      Participant.create!(
        match_uuid: match_uuid,
        match_request_uuid: opponent_request.uuid,
        player_uuid: opponent_request.player_uuid,
        opponent_uuid: player_uuid
      )

      Participant.create!(
        match_uuid: match_uuid,
        match_request_uuid: uuid,
        player_uuid: player_uuid,
        opponent_uuid: opponent_request.player_uuid
      )
    end
  end

  def find_opponent_request
    MatchRequest.
      where('player_uuid <> ?', player_uuid).
      where('uuid NOT IN (SELECT match_request_uuid FROM participants)').
      where('player_uuid NOT IN
      (SELECT opponent_uuid FROM participants WHERE player_uuid = ?)', player_uuid).
      first
  end

end
