class EveryResourceController < ApplicationController
  def destroy
    MatchRequest.destroy_all
    Participant.destroy_all
    render nothing: true
  end
end
