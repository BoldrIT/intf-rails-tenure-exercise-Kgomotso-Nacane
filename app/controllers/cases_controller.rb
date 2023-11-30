class CasesController < ApplicationController
  before_action :set_case, only: [:show, :update, :destroy]

  # GET /cases
  def index
    @cases = Case.all

    render 'cases/index', formats: [:json], handlers: [:jbuilder], status: 201
  end

  # GET /cases/1
  def show
    render json: @case
  end

  # POST /cases
  def create
    @case = Case.new(case_params)

    if @case.save
      render json: @case, status: :created, location: @case
    else
      render json: @case.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cases/1
  def update
    if @case.update(case_params)
      render json: @case
    else
      render json: @case.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cases/1
  def destroy
    @case.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_case
      @case = Case.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def case_params
      params.require(:case).permit(:candidate_fullname, :candidate_email, :due_date, :institution_id)
    end
end
