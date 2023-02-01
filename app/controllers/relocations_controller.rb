class RelocationsController < ApplicationController
  before_action :set_relocation, only: %i[ show edit update destroy ]

  # GET /relocations or /relocations.json
  def index
    @relocations = Relocation.all
  end

  # GET /relocations/1 or /relocations/1.json
  def show
  end

  # GET /relocations/new
  def new
    @relocation = Relocation.new
  end

  # GET /relocations/1/edit
  def edit
  end

  # POST /relocations or /relocations.json
  def create
    @relocation = Relocation.new(relocation_params)

    respond_to do |format|
      if @relocation.save
        format.html { redirect_to relocation_url(@relocation), notice: "Relocation was successfully created." }
        format.json { render :show, status: :created, location: @relocation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @relocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /relocations/1 or /relocations/1.json
  def update
    respond_to do |format|
      if @relocation.update(relocation_params)
        format.html { redirect_to relocation_url(@relocation), notice: "Relocation was successfully updated." }
        format.json { render :show, status: :ok, location: @relocation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @relocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relocations/1 or /relocations/1.json
  def destroy
    @relocation.destroy

    respond_to do |format|
      format.html { redirect_to relocations_url, notice: "Relocation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relocation
      @relocation = Relocation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def relocation_params
      params.require(:relocation).permit(:date_solicited, :date_accept, :_)
    end
end
