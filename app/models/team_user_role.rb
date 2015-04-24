class TeamUserRole < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
  belongs_to :team_role
end
