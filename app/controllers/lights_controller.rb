class LightsController < ApplicationController
  def index

  end

  def show
    # just for try
    msg = {:light => params[:id], :intensity => params[:id].to_i * 1.5,}
    render :json => msg
  end
end
