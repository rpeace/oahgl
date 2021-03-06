class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.save_steam_fields(session)

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
        session[:user_id] = @user.id
        HerosUsers.create(:hero_id => params[:first_hero], :user_id => @user.id)
        HerosUsers.create(:hero_id => params[:second_hero], :user_id => @user.id)
        HerosUsers.create(:hero_id => params[:third_hero], :user_id => @user.id)
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to root_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
        if params[:first_hero] != "" or params[:second_hero] != "" or params[:third_hero] != ""
          HerosUsers.where(:user_id => @user.id.to_s).each do |hu|
            hu.destroy
          end
        end
        if params[:first_hero] != ""
          HerosUsers.find_or_create_by(:hero_id => params[:first_hero].to_s, :user_id => @user.id.to_s)
        end
        if params[:second_hero] != ""
          HerosUsers.find_or_create_by(:hero_id => params[:second_hero].to_s, :user_id => @user.id.to_s)
        end
        if params[:third_hero] != ""
          HerosUsers.find_or_create_by(:hero_id => params[:third_hero].to_s, :user_id => @user.id.to_s)
        end
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    HerosUsers.destroy_all(:user_id => @user.id)
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:player_type, :steam_profile, :name, :provider, :uid, :logo, :mmr, :email, :first_pos, :second_pos)
    end
end
