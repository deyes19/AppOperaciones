class ResponsiblesController < ApplicationController
  before_action :set_responsible, only: %i[ show edit update destroy ]

  # GET /responsibles or /responsibles.json
  def index
    @responsibles = Responsible.all
  end

  # GET /responsibles/1 or /responsibles/1.json
  def show
  end

  # GET /responsibles/new
  def new
    @responsible = Responsible.new
  end

  # GET /responsibles/1/edit
  def edit
    @responsible=Responsible.find(params[:id])
  end

  # POST /responsibles or /responsibles.json
  def create
    @responsible = Responsible.new(responsible_params)

    respond_to do |format|
      if @responsible.save
        format.html { redirect_to responsibles_path, notice: "El responsable del activo fue creado satisfactoriamente" }
        format.json { render :show, status: :created, location: @responsible }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @responsible.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /responsibles/1 or /responsibles/1.json
  def update
    respond_to do |format|
      if @responsible.update(responsible_params)
        format.html { redirect_to responsibles_path, notice: "El responsable del activo fue actualizado satisfactoriamente" }
        format.json { render :show, status: :ok, location: @responsible }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @responsible.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responsibles/1 or /responsibles/1.json
  def destroy
    responsible = Responsible.find(params[:id])
    responsible.destroy
    redirect_to responsibles_path, notice: 'El responsable se ha eliminado satisfactoriamente'

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_responsible
      @responsible = Responsible.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def responsible_params
      params.require(:responsible).permit(:id, :name)
    end
end
