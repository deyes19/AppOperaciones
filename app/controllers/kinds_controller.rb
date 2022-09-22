class KindsController < ApplicationController
  before_action :set_kind, only: %i[ show edit update destroy ]

  # GET /kinds or /kinds.json
  def index
    @kinds = Kind.all
  end

  # GET /kinds/1 or /kinds/1.json
  def show
  end

  # GET /kinds/new
  def new
    @kind = Kind.new
  end

  # GET /kinds/1/edit
  def edit
    @kind=Kind.find(params[:id])
  end

  # POST /kinds or /kinds.json
  def create
    @kind = Kind.new(kind_params)

    respond_to do |format|
      if @kind.save
        format.html { redirect_to kinds_path, notice: "la clase de activo fue creada correctamente" }
        format.json { render :show, status: :created, location: @kind }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kind.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kinds/1 or /kinds/1.json
  def update
    respond_to do |format|
      if @kind.update(kind_params)
        format.html { redirect_to kinds_path, notice: "La clase de activo fue actualizada correctamente" }
        format.json { render :show, status: :ok, location: @kind }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kind.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kinds/1 or /kinds/1.json
  def destroy
    kind = Kind.find(params[:id])
    kind.destroy
    redirect_to kinds_path, notice: 'La clase se ha eliminado satisfactoriamente'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kind
      @kind = Kind.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kind_params
      params.require(:kind).permit(:id, :name)
    end
end
