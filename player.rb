
class Player

  VERSION = "Default Ruby folding player"

  def bet_request(game_state)
    for card in game_state[:players][5][:hole_cards]:
        if card[:rank] == "A":
            1000
        else:
            100
  end

  def showdown(game_state)

  end
end
