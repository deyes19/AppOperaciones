class CentersController < ApplicationController
  load_and_authorize_resource

  def import
    file = params[:file]
    return redirect_to centers_path, notice: 'Solo se admite formato por separación de comas (.CSV)' unless file.content_type == 'text/csv'

    CsvImportCentersService.new.call(file)

    redirect_to centers_path, notice: 'CENTROS DE COSTO IMPORTADOS EXITOSAMENTE'
  end


  # GET /zones or /zones.json
  def index
    @centers = Center.all
    if params[:query_text].present?
      @centers = @centers.search_full_text(params[:query_text])
    end
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
        format.html { redirect_to centers_path, notice: 'Tu centro de costo se ha creado correctamente', status: :see_other }
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
        format.html { redirect_to centers_path, notice: 'Tu centro de costo se ha actualizado correctamente', status: :see_other }
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
    redirect_to centers_path, notice: 'Tu centro de costo se ha eliminado correctamente', status: :see_other
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_center
      @center = Center.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def center_params
      params.require(:center).permit(:id, :name, :zone_id)
    end
end