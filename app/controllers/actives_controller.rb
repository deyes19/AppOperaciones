class ActivesController < ApplicationController
  load_and_authorize_resource
  protect_from_forgery with: :null_session, only: [:create, :update, :destroy]
  before_action :authorize_admin, only: [:index, :create, :update, :destroy]
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
    @actives = Active.where(status: true)
    if params[:query_text].present?
      @actives = @actives.search_full_text(params[:query_text])
    end
  end

  def index_not_active
    @actives = Active.where(status: false)
    if params[:query_text].present?
      @actives = @actives.search_full_text(params[:query_text])
    end
  end

  def authorize_admin
    redirect_to user_path(current_user), alert: "No tienes acceso a esta sección" unless current_user.admin?
  end

  # GET /actives/1 or /actives/1.json
  def show
  end

  # GET /actives/new
  def new
    @centers= Center.all
    @active=Active.new
  end
  def options
    @destinations = Destination.where(center_id: params[:center_id])
  end
  def optionss
    @ubications = Ubication.where(destination_id: params[:destination_id])
  end

  # GET /actives/1/edit
  def edit
    @centers= Center.all
  end

  # POST /actives or /actives.json
  def create
    @active = Active.new(active_params)
    @active.plate = @active.barcode
    @centers= Center.all
    respond_to do |format|
      if @active.save
        format.html { redirect_to actives_path, notice: "el activo fue creado" }
        format.json { render :show, status: :created, location: @active }
      else
        flash[:error] = "No se pudo crear el activo. Verifique los datos e intente nuevamente. Revisa que hayas seleccionado la ubicación y el destino"
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @active.errors, status: :unprocessable_entity }
      end
    end
  end  

  # PATCH/PUT /actives/1 or /actives/1.json
  def update
    @centers= Center.all
    @active.plate = @active.barcode
    if params[:status].present?
      down
    else
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
  end
  
  def down
    @active.toggle(:status)
    @active.user_id = 80000403900
    @active.save
    respond_to do |format|
      format.html { redirect_to actives_url, notice: "El estado del activo fue actualizado exitosamente." }
      format.json { head :no_content }
    end
  end

  # DELETE /actives/1 or /actives/1.json
  def destroy
    active = Active.find(params[:id])
    active.destroy
    redirect_to actives_path, notice: 'Tu activo se ha eliminado correctamente', status: :see_other
  end



  private
    # Use callbacks to share common setup or constraints between actions.

    # Only allow a list of trusted parameters through.
    def active_params
      params.require(:active).permit(:id, :barcode,:center_id, :serial, :name, :dad, :destination_id, :ubication_id, :plate , :user_id, :rankactive_id, :status, :active_type_id)
    end
end
