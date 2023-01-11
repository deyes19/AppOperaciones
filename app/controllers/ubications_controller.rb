class UbicationsController < ApplicationController
  load_and_authorize_resource

  def import
    file = params[:file]
    return redirect_to ubications_path, notice: 'Solo se admite formato por separación de comas (.CSV)' unless file.content_type == 'text/csv'

    CsvImportUbicationsService.new.call(file)

    redirect_to ubications_path, notice: 'CENTROS DE COSTO IMPORTADOS EXITOSAMENTE'
  end

  # GET /ubications or /ubications.json
  def index
    @ubications = Ubication.all
    if params[:query_text].present?
      @ubications = @ubications.search_full_text(params[:query_text])
    end
  end

  # GET /ubications/1 or /ubications/1.json
  def show
  end

  # GET /ubications/new
  def new
    @ubication = Ubication.new
  end

  # GET /ubications/1/edit
  def edit
    @ubication=Ubication.find(params[:id])
  end

  # POST /ubications or /ubications.json
  def create
    @ubication = Ubication.new(ubication_params)

    respond_to do |format|
      if @ubication.save
        format.html { redirect_to ubications_url(@ubication), notice: "Ubication was successfully created." }
        format.json { render :show, status: :created, location: @ubication }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ubication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ubications/1 or /ubications/1.json
  def update
    respond_to do |format|
      if @ubication.update(ubication_params)
        format.html { redirect_to ubications_path, notice: "Ubication was successfully updated." }
        format.json { render :show, status: :ok, location: @ubication }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ubication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ubications/1 or /ubications/1.json
  def destroy
    ubication = Ubication.find(params[:id])
    ubication.destroy
    redirect_to ubications_path, notice: 'Tu producto se ha eliminado correctamente', status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ubication
      @ubication = Ubication.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ubication_params
      params.require(:ubication).permit(:name, :id, :destination_id)
    end
end
