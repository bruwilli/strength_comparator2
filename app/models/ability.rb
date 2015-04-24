class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    case user.current_team_role
    when TeamRole::OwnerName
      can :invite User do |them|
        them.new_record? || TeamUserRole.where(team_id: user.current_team.id, user_id: them.id).length === 0
      end
      can [:update_team_role, :remove_user] User do |them|
        # To change role or remove from team, subject must be in our team, and must not be the last owner on the team
        TeamUserRole.where(team_id: user.current_team.id, user_id: them.id).length > 0 &&
        (them != user ||
         TeamUserRole.where(team_id: user.current_team.id, team_role_id: TeamRole.owner_team_role.id).length > 1)
      end
      can [:set_strengths, :show_strengths] User do |them|
        # Must be on the team to add/edit strengths
        TeamUserRole.where(team_id: user.current_team.id, user_id: them.id).length > 0
      end
      can [:update, :edit, :destroy, :show] Team do |team|
        user.current_team === team
      end
    when TeamRole::MemberName
      can [:update, :set_strengths, :show_strengths, :remove_user] User do |them|
        # Can only do the above for ourselves
        them === user
      end
    end

    # Available to users with all roles
    can [:show, :strength_matrix] Team do |team|
      user.current_team === team
    end
    can [:show_relative_strength_positions, :show_teams] User
    can [:new :create] Team
  end
end
