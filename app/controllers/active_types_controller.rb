class ActiveTypesController < ApplicationController
  before_action :set_active_type, only: %i[ show edit update destroy ]

  # GET /active_types or /active_types.json
  def index
    @active_types = ActiveType.all
  end

  # GET /active_types/1 or /active_types/1.json
  def show
  end

  # GET /active_types/new
  def new
    @active_type = ActiveType.new
  end

  # GET /active_types/1/edit
  def edit
    @active_type= ActiveType.find(params[:id])
  end

  # POST /active_types or /active_types.json
  def create
    @active_type = ActiveType.new(active_type_params)

    respond_to do |format|
      if @active_type.save
        format.html { redirect_to active_types_path, notice: "el tipo de activo fue creado satisctoriamente" }
        format.json { render :show, status: :created, location: @active_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @active_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /active_types/1 or /active_types/1.json
  def update
    respond_to do |format|
      if @active_type.update(active_type_params)
        format.html { redirect_to active_types_path, notice: "el tipo de activo fue actualizado" }
        format.json { render :show, status: :ok, location: @active_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @active_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /active_types/1 or /active_types/1.json
  def destroy
    active_type = ActiveType.find(params[:id])
    active_type.destroy
    redirect_to active_types_path, notice: 'Tu producto se ha eliminado correctamente', status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_active_type
      @active_type = ActiveType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def active_type_params
      params.require(:active_type).permit(:id, :description)
    end
end
