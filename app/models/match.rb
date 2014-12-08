class Match

  class << self
    def find(uuid)
      participants = Participant.where(match_uuid: uuid)
      if participants.any?
        new(uuid: participants[0].match_uuid,
            match_request_1_uuid: participants[0].match_request_uuid,
            match_request_2_uuid: participants[1].match_request_uuid)
      end
    end
  end

  def initialize(uuid: nil, match_request_1_uuid: nil, match_request_2_uuid: nil)
    @uuid = uuid
    @match_request_1_uuid = match_request_1_uuid
    @match_request_2_uuid = match_request_2_uuid
  end

  def as_json(*)
    {
      id: uuid,
      match_request_1_id: match_request_1_uuid,
      match_request_2_id: match_request_2_uuid,
    }
  end

  private

  attr_reader :uuid, :match_request_1_uuid, :match_request_2_uuid

end
