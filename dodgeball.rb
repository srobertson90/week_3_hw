require_relative('console.rb')

class League

  def list_teams
    teams = Team.all
    teams.map {|team| team.name}
  end


end