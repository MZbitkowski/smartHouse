class LightsController < ApplicationController
  def index

  end

  def show
    # just for try
    msg = {:light => params[:id], :intensity => params[:id].to_i * 1.5,}
    render :json => msg
  end

  def listen
    @message = {"action": "listen"}
    Subscriber.subscribe('lights', "garage")
    Subscriber.subscribe('lights', "bedroom")
    render :json => @message
  end

  def on
    @message = "on: 1"
    Publisher.publish('lights', 'garage', @message)
    Publisher.publish('lights', "bedroom" ,@message)
    respond_to do |format|
      format.json do
        render :json => @message
      end
    end
  end

  def off
    @message =  "on: 0"
    Publisher.publish('lights', 'garage', @message)
    Publisher.publish('lights', "bedroom" ,@message)
    respond_to do |format|
      format.json do
        render :json => @message
      end
    end
  end
end