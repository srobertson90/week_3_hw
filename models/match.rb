require ('pg')
require_relative('../db/sql_runner')

class Match

  attr_reader(:id, :home_team_id, :away_team_id, :home_team_score, :away_team_score)

  def initialize(input)
    @id = input['id'].to_i
    @home_team_id = input['home_team_id'].to_i
    @away_team_id = input['away_team_id'].to_i
    @home_team_score = input['home_team_score'].to_i
    @away_team_score = input['away_team_score'].to_i
  end

  def self.all
    sql = "SELECT * FROM matches"
    matches = SqlRunner.run(sql)
    return matches.map {|match| Match.new(match)}
  end

  def self.search_by_team_id(team_id)
    sql = "SELECT * FROM matches WHERE #{team_id} = home_team_id OR #{team_id} = away_team_id"
    matches = SqlRunner.run(sql)
    return matches.map {|match| Match.new(match)}
  end

  def save
    sql = "INSERT INTO matches (home_team_id, away_team_id, home_team_score, away_team_score) VALUES (#{home_team_id}, #{away_team_id}, #{home_team_score}, #{away_team_score}) RETURNING *"
    match = SqlRunner.run(sql).first
    @id = match['id'].to_i
  end

  def teams
    sql = "SELECT teams.* FROM teams WHERE id = #{@home_team_id} OR id = #{@away_team_id}"
    teams = SqlRunner.run(sql)
    return teams.map {|team| Team.new(team)}
  end

end