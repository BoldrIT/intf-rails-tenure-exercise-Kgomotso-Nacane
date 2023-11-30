class WorkStepsController < ApplicationController
  before_action :set_work_step, only: [:show, :update, :destroy]

  # GET /work_steps
  def index
    @work_steps = WorkStep.all

    render json: @work_steps
  end

  # GET /work_steps/1
  def show
    render json: @work_step
  end

  # POST /work_steps
  def create
    @work_step = WorkStep.new(work_step_params)

    if @work_step.save
      render json: @work_step, status: :created, location: @work_step
    else
      render json: @work_step.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /work_steps/1
  def update
    if @work_step.update(work_step_params)
      render json: @work_step
    else
      render json: @work_step.errors, status: :unprocessable_entity
    end
  end

  # DELETE /work_steps/1
  def destroy
    @work_step.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_step
      @work_step = WorkStep.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def work_step_params
      params.require(:work_step).permit(:step_number, :current, :case_id)
    end
end
