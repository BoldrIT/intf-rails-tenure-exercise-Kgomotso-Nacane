class WorkStepPanelsController < ApplicationController
  before_action :set_work_step_panel, only: [:show, :update, :destroy]

  # GET /work_step_panels
  def index
    @work_step_panels = WorkStepPanel.all

    render json: @work_step_panels
  end

  # GET /work_step_panels/1
  def show
    render json: @work_step_panel
  end

  # POST /work_step_panels
  def create
    @work_step_panel = WorkStepPanel.new(work_step_panel_params)

    if @work_step_panel.save
      render json: @work_step_panel, status: :created, location: @work_step_panel
    else
      render json: @work_step_panel.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /work_step_panels/1
  def update
    if @work_step_panel.update(work_step_panel_params)
      render json: @work_step_panel
    else
      render json: @work_step_panel.errors, status: :unprocessable_entity
    end
  end

  # DELETE /work_step_panels/1
  def destroy
    @work_step_panel.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_step_panel
      @work_step_panel = WorkStepPanel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def work_step_panel_params
      params.require(:work_step_panel).permit(:work_step_id, :panel_id)
    end
end
