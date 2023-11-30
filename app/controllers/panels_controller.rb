class PanelsController < ApplicationController
  before_action :set_panel, only: [:show, :update, :destroy]

  # GET /panels
  def index
    @panels = Panel.all

    render json: @panels
  end

  # GET /panels/1
  def show
    render json: @panel
  end

  # POST /panels
  def create
    @panel = Panel.new(panel_params)

    if @panel.save
      render json: @panel, status: :created, location: @panel
    else
      render json: @panel.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /panels/1
  def update
    if @panel.update(panel_params)
      render json: @panel
    else
      render json: @panel.errors, status: :unprocessable_entity
    end
  end

  # DELETE /panels/1
  def destroy
    @panel.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_panel
      @panel = Panel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def panel_params
      params.require(:panel).permit(:name, :case_id)
    end
end
