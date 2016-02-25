class WhiskiesController < ApplicationController

  # GET /whiskies
  # GET /whiskies.json
  def index
    @whiskies = Whisky.paginate(:page => params[:page], :per_page => 8)
  end

  def new
    @whisky = Whisky.new
  end

  def show
    @whisky = Whisky.find(params[:id])
    @cart_action = @whisky.cart_action current_user.try :id
  end

  # GET /whiskies/1
  # GET /whiskies/1.json

end