require 'test_helper'

class PlayerRolesControllerTest < ActionController::TestCase
  setup do
    @player_role = player_roles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:player_roles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create player_role" do
    assert_difference('PlayerRole.count') do
      post :create, player_role: {  }
    end

    assert_redirected_to player_role_path(assigns(:player_role))
  end

  test "should show player_role" do
    get :show, id: @player_role
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @player_role
    assert_response :success
  end

  test "should update player_role" do
    patch :update, id: @player_role, player_role: {  }
    assert_redirected_to player_role_path(assigns(:player_role))
  end

  test "should destroy player_role" do
    assert_difference('PlayerRole.count', -1) do
      delete :destroy, id: @player_role
    end

    assert_redirected_to player_roles_path
  end
end
