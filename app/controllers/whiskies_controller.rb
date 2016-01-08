class WhiskiesController < ApplicationController
  before_action :set_whisky, only: [:show, :edit, :update, :destroy]

  # GET /whiskies
  # GET /whiskies.json
  def index
    @whiskies = Whisky.all
  end

  # GET /whiskies/1
  # GET /whiskies/1.json
  def show
  end

  # GET /whiskies/new
  def new
    @whisky = Whisky.new
  end

  # GET /whiskies/1/edit
  def edit
  end

  # POST /whiskies
  # POST /whiskies.json
  def create
    @whisky = Whisky.new(whisky_params)

    respond_to do |format|
      if @whisky.save
        format.html { redirect_to @whisky, notice: 'Whisky was successfully created.' }
        format.json { render :show, status: :created, location: @whisky }
      else
        format.html { render :new }
        format.json { render json: @whisky.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /whiskies/1
  # PATCH/PUT /whiskies/1.json
  def update
    respond_to do |format|
      if @whisky.update(whisky_params)
        format.html { redirect_to @whisky, notice: 'Whisky was successfully updated.' }
        format.json { render :show, status: :ok, location: @whisky }
      else
        format.html { render :edit }
        format.json { render json: @whisky.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /whiskies/1
  # DELETE /whiskies/1.json
  def destroy
    @whisky.destroy
    respond_to do |format|
      format.html { redirect_to whiskies_url, notice: 'Whisky was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_whisky
      @whisky = Whisky.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def whisky_params
      params.require(:whisky).permit(:name, :old, :price, :liter, :land, :volume, :description, :pic_url)
    end
end
