class RankactivesController < ApplicationController
  load_and_authorize_resource

  # GET /rankactives or /rankactives.json


  def index
    @rankactives = Rankactive.all
  end

  # GET /rankactives/1 or /rankactives/1.json
  def show
  end

  # GET /rankactives/new
  def new
    @rankactive = Rankactive.new
  end

  # GET /rankactives/1/edit
  def edit
  end

  # POST /rankactives or /rankactives.json
  def create
    @rankactive = Rankactive.new(rankactive_params)

    respond_to do |format|
      if @rankactive.save
        format.html { redirect_to rankactives_path, notice: "La jerarquia fue creada" }
        format.json { render :show, status: :created, location: @rankactive }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rankactive.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rankactives/1 or /rankactives/1.json
  def update
    respond_to do |format|
      if @rankactive.update(rankactive_params)
        format.html { redirect_to rankactives_path, notice: "La jerarquia fue actualizada" }
        format.json { render :show, status: :ok, location: @rankactive }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rankactive.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rankactives/1 or /rankactives/1.json
  def destroy
    @rankactive.destroy

    respond_to do |format|
      format.html { redirect_to rankactives_url, notice: "la jerarquia fue eliminada" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rankactive
      @rankactive = Rankactive.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rankactive_params
      params.require(:rankactive).permit(:name)
    end
end
