require_relative('./models/match')
require_relative('./models/team')

require('pry-byebug')

team1 = Team.new ({'name' => 'Aberdeen All-Stars'})
team2 = Team.new ({'name' => 'Dundee Dandy-Men'})
team3 = Team.new ({'name' => 'Edinburgh Game-Enders'})
team4 = Team.new ({'name' => 'Glasgow Get-Gos'})

team1.save
team2.save
team3.save
team4.save

match1 = Match.new({
  'home_team_id' => team1.id,
  'away_team_id' => team2.id,
  'home_team_score' => 3,
  'away_team_score' => 5
  })
match2 = Match.new({
  'home_team_id' => team1.id,
  'away_team_id' => team3.id,
  'home_team_score' => 5,
  'away_team_score' => 1
  })
match3 = Match.new({
  'home_team_id' => team1.id,
  'away_team_id' => team4.id,
  'home_team_score' => 4,
  'away_team_score' => 5
  })
match4 = Match.new({
  'home_team_id' => team2.id,
  'away_team_id' => team3.id,
  'home_team_score' => 1,
  'away_team_score' => 5
  })
match5 = Match.new({
  'home_team_id' => team2.id,
  'away_team_id' => team4.id,
  'home_team_score' => 5,
  'away_team_score' => 4
  })
match6 = Match.new({
  'home_team_id' => team3.id,
  'away_team_id' => team4.id,
  'home_team_score' => 2,
  'away_team_score' => 5
  })

match1.save
match2.save
match3.save
match4.save
match5.save
match6.save

# binding.pry
# nil