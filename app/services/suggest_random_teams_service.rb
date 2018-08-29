class SuggestRandomTeamsService
  class NoGameInProgressError < StandardError
  end

  def self.suggest
    game_in_progress = Game.in_progress.includes(:results).first
    raise NoGameInProgressError if game_in_progress.nil?

    players_shuffled = game_in_progress.players.map(&:slack_user_name).shuffle
    "Randomized matchup: #{players_shuffled[0].mention_and_rank} and #{players_shuffled[1].mention_and_rank} vs. #{players_shuffled[2].mention_and_rank} and #{players_shuffled[3].mention_and_rank}"
  end
end
