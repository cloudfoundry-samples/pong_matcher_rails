class EveryResourceController < ActionController::Base
  def destroy
    render nothing: true
  end
end
