class MatchesController < ActionController::Base
  respond_to :json

  def show
    match = Match.find(params[:id])
    if match
      respond_with match
    else
      respond_with match, status: :not_found
    end
  end
end
