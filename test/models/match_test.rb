require 'test_helper'

class MatchTest < ActiveSupport::TestCase
  test "instantiated if there's a match" do
    MatchRequest.create!(uuid: 'sharapovarequest', player_uuid: 'sharapova')
    request_2 = MatchRequest.create!(uuid: 'williamsrequest', player_uuid: 'williams')
    match = Match.find(request_2.match_uuid)
    assert_not_nil(match.as_json[:id])
    assert_equal('sharapovarequest', match.as_json[:match_request_1_id])
    assert_equal('williamsrequest', match.as_json[:match_request_2_id])
  end

  test "nil if there's no match" do
    assert_nil Match.find('nonsense')
  end
end
