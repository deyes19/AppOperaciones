class GroupsController < ApplicationController
  before_action :set_group, only: %i[ show edit update destroy ]

  # GET /groups or /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1 or /groups/1.json
  def show
  end

  # GET groups/new
  def new
    @group = Group.new
  end

  # GET groups/1/edit
  def edit
    @group=Group.find(params[:id])
  end

  # POST /groups or groups.json
  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to groups_path, notice: 'Tu grupo se ha creado correctamente',  status: :see_other }
        format.json { render :show, status: :created, location: @group}
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to groups_path, notice: 'Tu producto se ha actualizado correctamente', status: :see_other }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    group = Group.find(params[:id])
    group.destroy
    redirect_to groups_path, notice: 'Tu producto se ha eliminado correctamente', status: :see_other
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:id, :name)
    end
end
