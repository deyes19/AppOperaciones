class DestinationsController < ApplicationController
  load_and_authorize_resource
  

  def import
    file = params[:file]
    return redirect_to destinations_path, notice: 'Sólo se admite formato de separación de comas (.CSV)' unless file.content_type == 'text/csv'

    CsvImportDestinationsService.new.call(file)

    redirect_to destinations_path, notice: 'ZONAS IMPORTADAS EXITOSAMENTE'
  end
  # GET /zones or /zones.json
  def index
    @destinations = Destination.all
    if params[:query_text].present?
      @destinations = @destinations.search_full_text(params[:query_text])
    end
  end

  # GET /zones/1 or /zones/1.json
  def show
  end

  # GET /zones/new
  def new
    @centers= Center.all
  end


  # GET /zones/1/edit
  def edit
    @destination=Destination.find(params[:id])
  end

  # POST /zones or /zones.json
  def create
    @destination = Destination.new(destination_params)
    @centers= Center.all
    respond_to do |format|
      if @destination.save
        format.html { redirect_to destinations_path, notice: 'Tu destino se ha creado correctamente', status: :see_other }
        format.json { render :show, status: :created, location: @destination }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @destination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /zones/1 or /zones/1.json
  def update
    respond_to do |format|
      if @destination.update(destination_params)
        format.html { redirect_to destinations_path, notice: 'Tu destino se ha actualizado correctamente', status: :see_other }
        format.json { render :show, status: :ok, location: @destination }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @destination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zones/1 or /zones/1.json
  def destroy
    destination = Destination.find(params[:id])
    destination.destroy
    redirect_to destinations_path, notice: 'Tu destino se ha eliminado correctamente', status: :see_other
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_destination
      @destination = Destination.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def destination_params
      params.require(:destination).permit(:id, :description, :center_id)
    end
end
