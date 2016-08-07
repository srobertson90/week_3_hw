require('pg')
require_relative('../db/sql_runner')

class Team

  attr_reader(:id, :name)

  def initialize(input)
    @id = input['id'].to_i
    @name = input['name']
  end

  def self.all
    sql = "SELECT * FROM teams"
    teams = SqlRunner.run(sql)
    return teams.map {|team| Team.new(team)}
  end

  def self.search_by_name(name)
    sql = "SELECT * FROM teams WHERE name = '#{name}'"
    team = SqlRunner.run(sql)
    team.map {|team| Team.new(team)}
  end

  def save
    sql = "INSERT INTO teams (name) VALUES ('#{name}') RETURNING *"
    team = SqlRunner.run(sql).first
    @id = team['id'].to_i
  end

  def matches
    sql = "SELECT matches.* FROM matches WHERE home_team_id = #{@id} OR away_team_id = #{@id}"
    matches = SqlRunner.run(sql)
    return matches.map {|match| Match.new(match)}
  end

  def rename(name)
    sql = "UPDATE teams SET name = '#{name}' WHERE id = '#{@id}"
    SqlRunner.run(sql)
    @name = name
  end

  def delete
    sql = "DELETE FROM teams WHERE id = '#{@id}"
    SqlRunner.run(sql)
  end

end