require 'test_helper'

class MatchesControllerTest < ActionController::TestCase
  setup do
    @match = matches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:matches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create match" do
    assert_difference('Match.count') do
      post :create, match: { ap_remake: @match.ap_remake, d_ban_0: @match.d_ban_0, d_ban_1: @match.d_ban_1, d_ban_2: @match.d_ban_2, d_ban_3: @match.d_ban_3, d_ban_4: @match.d_ban_4, d_pick_0: @match.d_pick_0, d_pick_1: @match.d_pick_1, d_pick_2: @match.d_pick_2, d_pick_3: @match.d_pick_3, d_pick_4: @match.d_pick_4, dire_team_id: @match.dire_team_id, duration: @match.duration, first_pick: @match.first_pick, match_id: @match.match_id, player_0_id: @match.player_0_id, player_1_id: @match.player_1_id, player_2_id: @match.player_2_id, player_3_id: @match.player_3_id, player_4_id: @match.player_4_id, player_5_id: @match.player_5_id, player_6_id: @match.player_6_id, player_7_id: @match.player_7_id, player_8_id: @match.player_8_id, player_9_id: @match.player_9_id, r_ban_0: @match.r_ban_0, r_ban_1: @match.r_ban_1, r_ban_2: @match.r_ban_2, r_ban_3: @match.r_ban_3, r_ban_4: @match.r_ban_4, r_pick_0: @match.r_pick_0, r_pick_1: @match.r_pick_1, r_pick_2: @match.r_pick_2, r_pick_3: @match.r_pick_3, r_pick_4: @match.r_pick_4, radiant_team_id: @match.radiant_team_id, winner: @match.winner }
    end

    assert_redirected_to match_path(assigns(:match))
  end

  test "should show match" do
    get :show, id: @match
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @match
    assert_response :success
  end

  test "should update match" do
    patch :update, id: @match, match: { ap_remake: @match.ap_remake, d_ban_0: @match.d_ban_0, d_ban_1: @match.d_ban_1, d_ban_2: @match.d_ban_2, d_ban_3: @match.d_ban_3, d_ban_4: @match.d_ban_4, d_pick_0: @match.d_pick_0, d_pick_1: @match.d_pick_1, d_pick_2: @match.d_pick_2, d_pick_3: @match.d_pick_3, d_pick_4: @match.d_pick_4, dire_team_id: @match.dire_team_id, duration: @match.duration, first_pick: @match.first_pick, match_id: @match.match_id, player_0_id: @match.player_0_id, player_1_id: @match.player_1_id, player_2_id: @match.player_2_id, player_3_id: @match.player_3_id, player_4_id: @match.player_4_id, player_5_id: @match.player_5_id, player_6_id: @match.player_6_id, player_7_id: @match.player_7_id, player_8_id: @match.player_8_id, player_9_id: @match.player_9_id, r_ban_0: @match.r_ban_0, r_ban_1: @match.r_ban_1, r_ban_2: @match.r_ban_2, r_ban_3: @match.r_ban_3, r_ban_4: @match.r_ban_4, r_pick_0: @match.r_pick_0, r_pick_1: @match.r_pick_1, r_pick_2: @match.r_pick_2, r_pick_3: @match.r_pick_3, r_pick_4: @match.r_pick_4, radiant_team_id: @match.radiant_team_id, winner: @match.winner }
    assert_redirected_to match_path(assigns(:match))
  end

  test "should destroy match" do
    assert_difference('Match.count', -1) do
      delete :destroy, id: @match
    end

    assert_redirected_to matches_path
  end
end
