class CentersController < ApplicationController
  before_action :set_center, only: %i[ show edit update destroy ]

  # GET /zones or /zones.json
  def index
    @centers = Center.all
  end

  # GET /zones/1 or /zones/1.json
  def show
  end

  # GET /zones/new
  def new
    @center = Center.new
    
  end

  # GET /zones/1/edit
  def edit
    @center=Center.find(params[:id])
  end

  # POST /zones or /zones.json
  def create
    @center = Center.new(center_params)

    respond_to do |format|
      if @center.save
        format.html { redirect_to centers_path, notice: 'Tu producto se ha creado correctamente', status: :see_other }
        format.json { render :show, status: :created, location: @center }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @center.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /zones/1 or /zones/1.json
  def update
    respond_to do |format|
      if @center.update(center_params)
        format.html { redirect_to centers_path, notice: 'Tu producto se ha actualizado correctamente', status: :see_other }
        format.json { render :show, status: :ok, location: @center }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @center.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zones/1 or /zones/1.json
  def destroy
    center = Center.find(params[:id])
    center.destroy
    redirect_to centers_path, notice: 'Tu producto se ha eliminado correctamente', status: :see_other
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_center
      @center = Center.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def center_params
      params.require(:center).permit(:id, :name)
    end
end