require_relative 'ranking'

class Player

  VERSION = "Default Ruby folding player"

  NAME = 'Rubot'
  BET_MULTIPLIER = 20

  def initialize
    @last_pot = -1
  end

  def bet_request(game_state)
    ranking = Ranking.new
    player = game_state['players'].select { |pl| pl['name'] == NAME }.first
    community_cards = game_state['community_cards']
    pot = player['pot']

    result = 0

    if pot != @last_pot
      cards = player['hole_cards']
      cards = player['hole_cards'] + community_cards unless community_cards.nil?
      result = ranking.weight_sqrt(ranking.rank(cards)) * BET_MULTIPLIER
    end

    puts "hole cards = #{player['hole_cards'].map { |c| short_card c }}"
    puts "community cards = #{game_state['community_cards'].map { |c| short_card c }}"
    puts "bet -> #{result}"

    @last_pot = pot
    result
  end

  def showdown(game_state)

  end
end

def short_card(card)
  letters = {'hearts' => 'H', 'diamonds' => 'D', 'spades' => 'D', 'clubs' => 'C'}
  letters[card['suit']] + card['rank']
end
