StrengthComparator::Application.routes.draw do
  devise_for :users
  root 'user#root'
  get "/users/:user_id/teams" => 'user#show_teams', as: "show_user_teams"
  get "/users/:user_id/strengths" => 'user#show_strengths'
  put "/users/:user_id/strengths" => 'user#set_strengths'
  put "/users/:user_id" => 'user#update'
  get "/users/:user_id" => 'user#show'
  
  get "/teams/:team_id/users/:user_id/strengths" => 'team#show_user_relative_strength_positions'
  post "/teams/:team_id/users" => 'team#invite_user'
  delete "/teams/:team_id/users/:user_id" => 'team#remove_user'
  put "/teams/:team_id/users/:user_id" => 'team#update_user_role'
  get "/teams/:team_id/strengths" => 'team#strength_matrix', as: "show_team_strength_matrix"
  put "/teams/:team_id" => 'team#update'
  delete "/teams/:team_id" => 'team#destroy'
  get "/teams/:team_id" => 'team#show', as: "show_team"
  get "/teams/:team_id/new" => 'team#new'
  post "/teams" => 'team#create'
end
