
class Player

  VERSION = "Default Ruby folding player"

  NAME = 'Rubot'

  def bet_request(game_state)
    player = game_state['players'].select { |pl| pl['name'] == NAME }.first

    for card in player['hole_cards']
        if card[:rank] == "A"
            1000
        else
            100
        end
    end

    25
  end

  def showdown(game_state)

  end
end
