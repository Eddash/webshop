class WhiskiesController < ApplicationController

  # GET /whiskies
  # GET /whiskies.json
  def index
    @whiskies = Whisky.all
  end

  # GET /whiskies/1
  # GET /whiskies/1.json
  def show
  end
end
