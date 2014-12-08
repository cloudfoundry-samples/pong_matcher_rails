class ResultsController < ActionController::Base
  def create
    render nothing: true, status: :created
  end
end
