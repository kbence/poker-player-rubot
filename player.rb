
class Player

  VERSION = "Default Ruby folding player"

  NAME = 'Rubot'

  def bet_request(game_state)
    player = game_state['players'].select { |pl| pl['name'] == NAME }.first
    bet = 0
    player['hole_cards'].each do |card|
        if card['rank'] == "A" || card['rank'] == "K" || card['rank'] == "Q" || card['rank'] == "J"
            bet = 500
        elsif card['rank'] == "10"
            bet = 100
        end
    end
    bet
  end

  def showdown(game_state)

  end
end
