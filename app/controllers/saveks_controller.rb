class SaveksController < ApplicationController
  before_action :set_savek, only: [:show, :edit, :update, :destroy]

  # GET /saveks
  # GET /saveks.json
  def index
    before = Time.at((params[:before] || Time.now).to_i)
    count = params[:count] || 10
    @saveks = Savek.where(updated_at: Time.at(0)..before).limit(count)
    @last_count = @saveks.last.updated_at.to_i
  end

  # GET /saveks/1
  # GET /saveks/1.json
  def show
  end

  # GET /saveks/new
  def new
    @savek = Savek.new
  end

  # GET /saveks/1/edit
  def edit
  end

  # POST /saveks
  # POST /saveks.json
  def create
    @savek = Savek.new(savek_params)

    respond_to do |format|
      if @savek.save
        format.html { redirect_to @savek, notice: 'Savek was successfully created.' }
        format.json { render :show, status: :created, location: @savek }
      else
        format.html { render :new }
        format.json { render json: @savek.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /saveks/1
  # PATCH/PUT /saveks/1.json
  def update
    respond_to do |format|
      if @savek.update(savek_params)
        format.html { redirect_to @savek, notice: 'Savek was successfully updated.' }
        format.json { render :show, status: :ok, location: @savek }
      else
        format.html { render :edit }
        format.json { render json: @savek.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /saveks/1
  # DELETE /saveks/1.json
  def destroy
    @savek.destroy
    respond_to do |format|
      format.html { redirect_to saveks_url, notice: 'Savek was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_savek
      @savek = Savek.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def savek_params
      params.require(:savek).permit(:first_name, :last_name, :occupation, :latitude, :longitude, :radius, :avg_rating, :ratings, :gender, :address, :phone)
    end
end
