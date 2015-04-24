class Team < ActiveRecord::Base
  has_many :team_user_roles
end
