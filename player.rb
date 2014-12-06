require_relative 'ranking'

class Player

  attr_accessor :last_pot

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
    hand_value = nil

    if pot != @last_pot
      cards = player['hole_cards']
      cards = player['hole_cards'] + community_cards unless community_cards.nil?
      hand_value = ranking.rank(cards)
      result = ranking.weight_sqrt(hand_value) * BET_MULTIPLIER
    end

    log "hole cards = #{player['hole_cards'].map { |c| short_card c }}"
    log "community cards = #{game_state['community_cards'].map { |c| short_card c }}"
    log "hand value -> #{hand_value}"
    log "bet -> #{result}"

    @last_pot = pot
    result
  end

  def showdown(game_state)
    @last_pot = -1
  end
end

def log(msg)
  puts "[#{Time.new.strftime("%Y-%m-%d %H:%M:%S")}] #{msg}"
end

def short_card(card)
  letters = {'hearts' => 'H', 'diamonds' => 'D', 'spades' => 'D', 'clubs' => 'C'}
  letters[card['suit']] + card['rank']
end
