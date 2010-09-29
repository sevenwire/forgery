class Forgery::Sports < Forgery

  def self.nfl_football_team
    dictionaries[:football_nfl_teams].random
  end

  def self.ncaa_football_team
    dictionaries[:football_ncaa_teams].random
  end

  def self.football_team
    [dictionaries[:football_nfl_teams], dictionaries[:football_ncaa_teams]].random.random
  end

  def self.nhl_hockey_team
    dictionaries[:hockey_nhl_teams].random
  end

  def self.nba_basketball_team
    dictionaries[:basketball_nba_teams].random
  end
  
  def self.sports_team
    [
      dictionaries[:football_nfl_teams], 
      dictionaries[:football_ncaa_teams],
      dictionaries[:hockey_nhl_teams],
      dictionaries[:basketball_nba_teams]
    ].random.random
  end
end
