require 'test_helper'

class MatchRequestTest < ActiveSupport::TestCase
  test "two consecutively stored match requests get same match ID" do
    request_1 = MatchRequest.create!(uuid: 'sharapovarequest', player_uuid: 'sharapova')
    request_2 = MatchRequest.create!(uuid: 'williamsrequest', player_uuid: 'williams')
    assert_not_nil request_1.reload.match_uuid
    assert_equal request_1.match_uuid, request_2.reload.match_uuid
  end

  test "further match requests get different match ID" do
    request_1 = MatchRequest.create!(uuid: 'sharapovarequest', player_uuid: 'sharapova')
    request_2 = MatchRequest.create!(uuid: 'williamsrequest', player_uuid: 'williams')
    request_3 = MatchRequest.create!(uuid: 'borisrequest', player_uuid: 'boris')
    request_4 = MatchRequest.create!(uuid: 'navratilovarequest', player_uuid: 'navratilova')
    assert_equal request_1.match_uuid, request_2.reload.match_uuid
    assert_equal request_3.reload.match_uuid, request_4.reload.match_uuid
    assert_not_equal request_1.reload.match_uuid, request_3.reload.match_uuid
  end

  test "new match request has a nil match ID" do
    assert_nil MatchRequest.new.match_uuid
  end
end
