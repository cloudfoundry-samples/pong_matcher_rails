class MatchRequestsController < ActionController::Base
  respond_to :json

  def create
    respond_with MatchRequest.create(uuid: params[:id],
                                     player: params[:player])
  end

  def show
    respond_with MatchRequest.find_by_uuid(params[:id])
  end
end
