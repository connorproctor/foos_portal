class SuggestRandomTeamsService
  class NoGameInProgressError < StandardError
  end

  def self.suggest
    game_in_progress = Game.in_progress.includes(:results).first
    raise NoGameInProgressError if game_in_progress.nil?

    players_shuffled = game_in_progress.players.map(&:slack_user_name).shuffle
    "Randomized matchup: #{players_shuffled[0].mention} and #{players_shuffled[1].mention} vs. #{players_shuffled[2].mention} and #{players_shuffled[3].mention}"
  end
end
