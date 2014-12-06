
class Player

  VERSION = "Default Ruby folding player"

  NAME = 'Rubot'

  def bet_request(game_state)
    player = game_state['players'].select { |pl| pl['name'] == NAME }.first
    bet = 0
    for card in player['hole_cards']
        if card[:rank] == "A"
            bet = 1000
        else
            bet = 100
        end
    end

    bet
  end

  def showdown(game_state)

  end
end
