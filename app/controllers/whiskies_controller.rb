class WhiskiesController < ApplicationController

# GET /whiskies
# GET /whiskies.json
  def index
    @whiskies = Whisky.all
  end

  def new
    @whisky = Whisky.new
  end

# GET /whiskies/1
# GET /whiskies/1.json
  def show
    @whisky = Whisky.find(params[:id])
  end
end