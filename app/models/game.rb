class Game < ApplicationRecord
  include GameStats
  belongs_to :season
  belongs_to :game_date
  belongs_to :home_team, class_name: "Team"
  belongs_to :away_team, class_name: "Team"
  has_many :periods, dependent: :destroy

  def teams
    return away_team, home_team
  end

  def show_data
    away_team_name = self.away_team.name
    home_team_name = self.home_team.name
    period = self.full_game
    away_players = period.away_player_stats.map(&:stat_hash)
    home_players = period.home_player_stats.map(&:stat_hash)
    return { away_team: { name: away_team_name, players: away_players }, home_team: { name: home_team_name, players: home_players } }
  end

  def url
    "%d%02d%02d0#{home_team.abbr}" % [date.year, date.month, date.day]
  end

  def full_game
    periods.find_by(quarter: 0)
  end

  def quarters
    periods.where("quarter > 0 AND quarter < 5")
  end

  [0, 1, 2, 3, 4, 5, 6, 7].each do |quarter|
    define_method "stats#{quarter}" do
      period = periods.find_by(quarter: quarter)
      periods.stats.includes(:statable) if period
    end
  end

  def method_missing(name, *args, &block)
    game_date.send(name, *args, &block)
  end
end
