class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :invitable

  serialize :strength_indices

  has_many :team_user_roles
  has_many :teams, through: :team_user_roles

  attr_accessor :current_team
  attr_accessor :current_team_role

  def name
    self.first_name.to_s == '' ? 
      self.email_address : 
      "#{self.first_name} #{self.last_name}"
  end
end
