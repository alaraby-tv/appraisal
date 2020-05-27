class ObjectivesController < ApplicationController
  before_action :set_group
  before_action :set_section
  before_action :set_objective, only: [:show, :edit, :update, :destroy]

  # GET /objectives
  # GET /objectives.json
  def index
    @objectives = @section.objectives
  end

  # GET /objectives/1
  # GET /objectives/1.json
  def show
  end

  # GET /objectives/new
  def new
    @objective = @section.objectives.build
  end

  # GET /objectives/1/edit
  def edit
  end

  # POST /objectives
  # POST /objectives.json
  def create
    @objective = @section.objectives.build(objective_params)

    respond_to do |format|
      if @objective.save
        format.html { redirect_to @group, notice: 'Objective was successfully created.' }
        format.json { render :show, status: :created, location: @objective }
      else
        format.html { render :new }
        format.json { render json: @objective.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /objectives/1
  # PATCH/PUT /objectives/1.json
  def update
    respond_to do |format|
      if @objective.update(objective_params)
        format.html { redirect_to @group, notice: 'Objective was successfully updated.' }
        format.json { render :show, status: :ok, location: @objective }
      else
        format.html { render :edit }
        format.json { render json: @objective.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /objectives/1
  # DELETE /objectives/1.json
  def destroy
    @objective.destroy
    respond_to do |format|
      format.html { redirect_to @group, notice: 'Objective was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_section
    @section = @group.sections.find(params[:section_id])
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_objective
    @objective = @section.objectives.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def objective_params
    params.require(:objective).permit(:name, :section_id, :percentage)
  end
end
