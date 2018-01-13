class SuggestRandomTeamsService
  class NoGameInProgressError < StandardError
  end

  def self.suggest
    game_in_progress = Game.in_progress.includes(:results).first
    raise NoGameInProgressError if game_in_progress.nil?

    players_shuffled = game.players.map(&:slack_user_name).shuffle
    "Randomized matchup: #{players_shuffled[0]} and #{players_shuffled[1]} vs. #{players_shuffled[2]} and #{players_shuffled[3]}"
  end
end
