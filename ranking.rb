class Ranking
  def rank(cards)
    value = 0
    value += debug_val('cards', rank_cards(cards[0..1]))
    value += debug_val('same cards', rank_same_cards(cards))
    value += debug_val('flush', rank_flush(cards))
    puts '----'

    value
  end

  def debug_val(msg, val)
    puts "#{msg}: #{val}"
    val
  end

  def combine(cards)
    hole_cards = cards[0..1]
    community_cards[2..-1]
  end

  def choose(cards, num)
  end

  def rank_flush(cards)
    suits = {}

    cards.each do |card|
      suit = card['suit']

      if suits.has_key? suit
        suits[suit] += 1
      else
        suits[suit] = 1
      end
    end

    case suits.values.max
      when 4
        60
      when 5
        100
      else
        0
    end
  end

  def rank_same_cards(cards)
    ranks = {}

    cards.each do |card|
      rank = card['rank']

      if ranks.has_key? rank
        ranks[rank] += 1
      else
        ranks[rank] = 1
      end
    end

    if ranks.has_value? 3
      return 50
    end

    if ranks.has_value? 2
      return case ranks.select { |k, v| v == 2 }.length
               when 2
                 60
               else
                 20
             end
    end

    0
  end

  def rank_cards(cards)
    sum(cards.map do |card|
          rank = card['rank']

          if %w(A Q K J 10).include? rank
            5
          else
            0
          end
        end)
  end

  def sum(array)
    array.inject { |sum, x| sum + x }
  end

  def weight_sqrt(value)
    Math.sqrt(value).to_i
  end
end
