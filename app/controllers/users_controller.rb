class UsersController < ApplicationController
  def root
    redirect_to show_user_teams_url(current_user) and return if user_signed_in?
    redirect_to new_user_session_url 
  end

  def show_teams
    authorize! :show_teams
    @teams = current_user.teams
  end

  def set_strengths
    user = User.find(params[:user_id])
    authorize! :set_strengths user 
    user.update! params[:strength_indices]
    flash[:success] = "Strengths set for #{user.first_name} #{user.last_name}"
    redirect_to show_team_strength_matrix_url(current_user.current_team)
  end

  def show_strengths
    @user = User.find(params[:user_id])
    authorize! :show_strengths @user
  end

  def update
    @user = User.find(params[:user_id])
    authorize! :update @user
    user.update! params[:user]
  end

  def show
    @user = User.find(params[:user_id])
    authorize! :show @user
  end
end
