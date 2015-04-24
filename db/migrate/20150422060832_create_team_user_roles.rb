class CreateTeamUserRoles < ActiveRecord::Migration
  def change
    create_table :team_user_roles do |t|
      t.belongs_to :user, index: true
      t.belongs_to :team, index: true
      t.belongs_to :team_role, index: true

      t.timestamps
    end
  end
end
