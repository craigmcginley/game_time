games = [
  {
    home_team: "Patriots",
    away_team: "Broncos",
    home_score: 7,
    away_score: 3
  },
  {
    home_team: "Broncos",
    away_team: "Colts",
    home_score: 3,
    away_score: 0
  },
  {
    home_team: "Patriots",
    away_team: "Colts",
    home_score: 11,
    away_score: 7
  },
  {
    home_team: "Steelers",
    away_team: "Patriots",
    home_score: 7,
    away_score: 21
  }
]
def compile_data(games)
  teams = {}

  games.each do |game|
    if !teams.has_key?(game[:home_team])
      teams.store(game[:home_team], {wins: 0,
                                    losses: 0,
                                    ties: 0,
                                    games: []})

    elsif !teams.has_key?(game[:away_team])
      teams.store(game[:away_team], {wins: 0,
                                    losses: 0,
                                    ties: 0,
                                    games: []})
    end
  end

  games.each do |game|
    if game[:home_score] > game[:away_score]
      teams[game[:home_team]][:games] << game
      teams[game[:home_team]][:wins] += 1
      teams[game[:away_team]][:games] << game
      teams[game[:away_team]][:losses] += 1
    elsif game[:away_score] > game[:home_score]
      teams[game[:away_team]][:games] << game
      teams[game[:away_team]][:wins] += 1
      teams[game[:home_team]][:games] << game
      teams[game[:home_team]][:losses] += 1
    else
      teams[game[:home_team]][:games] << game
      teams[game[:home_team]][:ties] += 1
      teams[game[:away_team]][:games] << game
      teams[game[:away_team]][:ties] += 1
    end
  end
  teams
end

teams_stats = compile_data(games)

# get '/leaderboard' do

# end


# get '/:team' do

# end
