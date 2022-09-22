class SuppliersController < ApplicationController
  before_action :set_supplier, only: %i[ show edit update destroy ]

  # GET /suppliers or /suppliers.json
  def index
    @suppliers = Supplier.all
  end

  # GET /suppliers/1 or /suppliers/1.json
  def show
  end

  # GET /suppliers/new
  def new
    @supplier = Supplier.new
  end

  # GET /suppliers/1/edit
  def edit
    @supplier=Supplier.find(params[:id])
  end

  # POST /suppliers or /suppliers.json
  def create
    @supplier = Supplier.new(supplier_params)

      respond_to do |format|
        if @supplier.save
          format.html { redirect_to suppliers_path, notice: "El proveedor fue creada correctamente" }
          format.json { render :show, status: :created, location: @supplier }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @supplier.errors, status: :unprocessable_entity }
        end
      end
  end

  # PATCH/PUT /suppliers/1 or /suppliers/1.json
  def update
    respond_to do |format|
      if @supplier.update(supplier_params)
        format.html { redirect_to suppliers_path, notice: "El proveedor fue actualizado correctamente" }
        format.json { render :show, status: :ok, location: @supplier }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suppliers/1 or /suppliers/1.json
  def destroy
    supplier = Supplier.find(params[:id])
    supplier.destroy
    redirect_to suppliers_path, notice: 'El proveedor se ha eliminado satisfactoriamente'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def supplier_params
      params.require(:supplier).permit(:id, :nit, :description)
    end
end
