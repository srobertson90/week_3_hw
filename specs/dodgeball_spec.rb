require ('minitest/autorun')
require ('minitest/rg')

require_relative ('../dodgeball')

class TestLeague < Minitest::Test

  def setup
    @test_league = League.new()
  end

  def test_list_teams
    assert_equal(["Aberdeen All-Stars", "Dundee Dandy-Men", "Edinburgh Game-Enders", "Glasgow Get-Gos"], @test_league.list_teams())
  end

end