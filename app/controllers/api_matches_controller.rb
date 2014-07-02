class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]

  # GET /matches
  # GET /matches.json
  def index
    @matches = Match.all
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
    @performances = []
    @performances.push(Performance.find_by_performance_id(@match.match_id.to_s + "-" + @match.player_0_id.to_s))
    @performances.push(Performance.find_by_performance_id(@match.match_id.to_s + "-" + @match.player_1_id.to_s))
    @performances.push(Performance.find_by_performance_id(@match.match_id.to_s + "-" + @match.player_2_id.to_s))
    @performances.push(Performance.find_by_performance_id(@match.match_id.to_s + "-" + @match.player_3_id.to_s))
    @performances.push(Performance.find_by_performance_id(@match.match_id.to_s + "-" + @match.player_4_id.to_s))
    @performances.push(Performance.find_by_performance_id(@match.match_id.to_s + "-" + @match.player_5_id.to_s))
    @performances.push(Performance.find_by_performance_id(@match.match_id.to_s + "-" + @match.player_6_id.to_s))
    @performances.push(Performance.find_by_performance_id(@match.match_id.to_s + "-" + @match.player_7_id.to_s))
    @performances.push(Performance.find_by_performance_id(@match.match_id.to_s + "-" + @match.player_8_id.to_s))
    @performances.push(Performance.find_by_performance_id(@match.match_id.to_s + "-" + @match.player_9_id.to_s))
  end

  # GET /matches/new
  def new
    @match = Match.new
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches
  # POST /matches.json
  def create
    @match = Match.new(match_params)

    respond_to do |format|
      if @match.save
        format.html { redirect_to @match, notice: 'Match was successfully created.' }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  def update
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to @match, notice: 'Match was successfully updated.' }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match.destroy
    respond_to do |format|
      format.html { redirect_to matches_url, notice: 'Match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find_by_match_id(params[:id].to_i)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
      params.require(:match).permit(:match_id, :winner, :duration, :radiant_team_id, :dire_team_id, :player_0_id, :player_1_id, :player_2_id, :player_3_id, :player_4_id, :player_5_id, :player_6_id, :player_7_id, :player_8_id, :player_9_id, :first_pick, :ap_remake, :d_ban_0, :r_ban_0, :d_ban_1, :r_ban_1, :d_pick_0, :r_pick_0, :r_pick_1, :d_pick_1, :d_ban_2, :r_ban_2, :d_ban_3, :r_ban_3, :r_pick_2, :d_pick_2, :r_pick_3, :d_pick_3, :r_ban_4, :d_ban_4, :r_pick_4, :d_pick_4)
    end
end
