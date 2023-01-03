class ActivesController < ApplicationController
  load_and_authorize_resource


  def import1
    file = params[:file]
    return redirect_to actives_path, notice: 'Sólo se admite formato de separación de comas (.CSV)' unless file.content_type == 'text/csv'

    CsvImportActivesService.new.call(file)

    redirect_to actives_path, notice: 'ACTIVOS IMPORTADOS EXITOSAMENTE'
  end
  def import2
    file = params[:file]
    return redirect_to actives_path, notice: 'Sólo se admite formato de separación de comas (.CSV)' unless file.content_type == 'text/csv'

    CsvImportActivesService2.new.call(file)

    redirect_to actives_path, notice: 'ACTIVOS IMPORTADOS EXITOSAMENTE'
  end

  # GET /actives or /actives.json
  def index
    @actives = Active.all
    if params[:query_text].present?
      @actives = @actives.search_full_text(params[:query_text])
    end
  end

  # GET /actives/1 or /actives/1.json
  def show
  end

  # GET /actives/new
  def new
  end

  # GET /actives/1/edit
  def edit
  end

  # POST /actives or /actives.json
  def create
    @active = Active.new(active_params)
    @active.user_id = current_user.id

    respond_to do |format|
      if @active.save
        format.html { redirect_to actives_path, notice: "el tipo de activo fue creado" }
        format.json { render :show, status: :created, location: @active }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @active.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actives/1 or /actives/1.json
  def update
    respond_to do |format|
      if @active.update(active_params)
        format.html { redirect_to actives_path, notice: "el activo fue actualizado" }
        format.json { render :show, status: :ok, location: @active }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @active.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actives/1 or /actives/1.json
  def destroy
    @active.destroy

    respond_to do |format|
      format.html { redirect_to actives_url, notice: "Active was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Only allow a list of trusted parameters through.
    def active_params
      params.require(:active).permit(:id, :barcode, :serial, :name, :destination_id, :ubication_id, :plate, :status, :active_type_id)
    end
end
