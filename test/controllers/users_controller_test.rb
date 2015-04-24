require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get invite" do
    get :invite
    assert_response :success
  end

  test "should get update_team_role" do
    get :update_team_role
    assert_response :success
  end

  test "should get :edit_team_role" do
    get ::edit_team_role
    assert_response :success
  end

  test "should get show_team_roles" do
    get :show_team_roles
    assert_response :success
  end

  test "should get remove_from_team" do
    get :remove_from_team
    assert_response :success
  end

  test "should get add_strengths" do
    get :add_strengths
    assert_response :success
  end

  test "should get edit_strengths" do
    get :edit_strengths
    assert_response :success
  end

  test "should get add_strengths" do
    get :add_strengths
    assert_response :success
  end

  test "should get show_strengths" do
    get :show_strengths
    assert_response :success
  end

  test "should get new_strengths" do
    get :new_strengths
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show_teams" do
    get :show_teams
    assert_response :success
  end

end
