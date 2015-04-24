class TeamRole < ActiveRecord::Base
  OwnerName = 'Owner'
  MemberName = 'Member'

  def self.owner_team_role
    return self.where(name: TeamRole::OwnerName).first
  end
  def self.member_team_role
    return self.where(name: TeamRole::MemberName).first
  end
end
