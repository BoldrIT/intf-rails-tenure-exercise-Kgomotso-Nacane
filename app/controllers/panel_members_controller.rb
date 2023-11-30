class PanelMembersController < ApplicationController
  before_action :set_panel_member, only: [:show, :update, :destroy]

  # GET /panel_members
  def index
    @panel_members = PanelMember.all

    render json: @panel_members
  end

  # GET /panel_members/1
  def show
    render json: @panel_member
  end

  # POST /panel_members
  def create
    @panel_member = PanelMember.new(panel_member_params)

    if @panel_member.save
      render json: @panel_member, status: :created, location: @panel_member
    else
      render json: @panel_member.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /panel_members/1
  def update
    if @panel_member.update(panel_member_params)
      render json: @panel_member
    else
      render json: @panel_member.errors, status: :unprocessable_entity
    end
  end

  # DELETE /panel_members/1
  def destroy
    @panel_member.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_panel_member
      @panel_member = PanelMember.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def panel_member_params
      params.require(:panel_member).permit(:panel_id, :user_id)
    end
end
