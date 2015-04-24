class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :initialize_team_role


  def initialize_team_role
    unless current_user.nil? || current_user.new_record?
      if params.has_key?(:team_id)
        current_user.current_team = Team.find(params[:team_id]) 
        unless current_user.current_team.nil?
          current_user.current_team_role = TeamUserRole.where(team_id: current_user.current_team.id, user_id: current_user.id).first.team_role
        end
      end     
    end
  end

end
