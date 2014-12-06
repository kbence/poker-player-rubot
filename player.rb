require_relative 'ranking'

class Player

  VERSION = "Default Ruby folding player"

  NAME = 'Rubot'

  def bet_request(game_state)
    ranking = Ranking.new
    player = game_state['players'].select { |pl| pl['name'] == NAME }.first

    ranking.rank(player['hole_cards']) * 25
  end

  def showdown(game_state)

  end
end
