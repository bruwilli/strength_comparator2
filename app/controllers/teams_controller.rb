class TeamsController < ApplicationController
  # invite user to team
  def invite_user
    authorize! :invite_user current_user.current_team
    user = User.invite!(params[:email_address], current_user)
    TeamUserRole.create(user: user, team: current_user.current_team, team_role_id: params[:team_role_id])
    flash[:success] = "Strengths set for #{user.name}"
    redirect_to show_team_url(current_user.current_team)
  end

  # remove user from team
  def remove_user
    user = User.find(params[:user_id])
    authorize! :remove_user user
    TeamUserRole.where(user: user, team: current_user.team).first.destroy
    flash[:success] = "#{user.name} has been remove from the \"#{current_user.team.name}\" team"
    redirect_to show_team_url(current_user.team)
  end

  # update user team role
  def update_user_role
    user = User.find(params[:user_id])
    authorize! :update_user_role user
    team_role = TeamRole.find(params[:team_role_id])
    TeamUserRole.where(user: user, team: current_user.team).first.update(team_role: team_role)
    flash[:success] = "Role for #{user.name} changed to \"#{team_role.name}\""
    redirect_to show_team_url(current_user.team)
  end

  # show strengths of other users on team relative to a user
  def show_user_relative_strength_matrix
    user = User.find(params[:user_id])
    authorize! :
  end

  def strength_matrix
  end

  # Can only update team name.  User #remove_user to remove a user
  def update
  end

  # Remove a team
  def destroy
  end

  # Show team name and list of users and their permissions
  def show
    @team = Team.find(params[:team_id])
    authorize! :show @team
    @team_user_roles = TeamUserRole.where(team_id: @team.id)
    @team_user_roles.sort! do |x, y|
      return x.user.name <=> y.user.name
    end
  end

  # Show form used to create a new team
  def new
    authorize! :new Team
    @team = Team.new
  end

  def create
    authorize! :create Team

  end
end
