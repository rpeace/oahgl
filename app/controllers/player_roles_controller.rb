class PlayerRolesController < ApplicationController
  before_action :set_player_role, only: [:show, :edit, :update, :destroy]

  # GET /player_roles
  # GET /player_roles.json
  def index
    @player_roles = PlayerRole.all
  end

  # GET /player_roles/1
  # GET /player_roles/1.json
  def show
  end

  # GET /player_roles/new
  def new
    @player_role = PlayerRole.new
  end

  # GET /player_roles/1/edit
  def edit
  end

  # POST /player_roles
  # POST /player_roles.json
  def create
    @player_role = PlayerRole.new(player_role_params)

    respond_to do |format|
      if @player_role.save
        format.html { redirect_to @player_role, notice: 'Player role was successfully created.' }
        format.json { render :show, status: :created, location: @player_role }
      else
        format.html { render :new }
        format.json { render json: @player_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /player_roles/1
  # PATCH/PUT /player_roles/1.json
  def update
    respond_to do |format|
      if @player_role.update(player_role_params)
        format.html { redirect_to @player_role, notice: 'Player role was successfully updated.' }
        format.json { render :show, status: :ok, location: @player_role }
      else
        format.html { render :edit }
        format.json { render json: @player_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /player_roles/1
  # DELETE /player_roles/1.json
  def destroy
    @player_role.destroy
    respond_to do |format|
      format.html { redirect_to player_roles_url, notice: 'Player role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player_role
      @player_role = PlayerRole.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_role_params
      params[:player_role]
    end
end
