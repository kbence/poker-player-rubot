require_relative 'ranking'

class Player

  VERSION = "Default Ruby folding player"

  NAME = 'Rubot'
  BET_MULTIPLIER = 10

  def bet_request(game_state)
    ranking = Ranking.new
    player = game_state['players'].select { |pl| pl['name'] == NAME }.first
    community_cards = game_state['community_cards']

    cards = player['hole_cards'] + community_cards unless community_cards.nil?
    ranking.rank(cards) * BET_MULTIPLIER
  end

  def showdown(game_state)

  end
end
