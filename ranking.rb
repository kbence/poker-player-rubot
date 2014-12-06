
class Ranking
  def rank(cards)
    value = 0
    value += rank_cards(cards)
    value += rank_same_cards(cards)

    value
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

    if ranks.has_value? 2
      20
    else
      0
    end

  end

  def rank_cards(cards)
    sum(cards.map do |card|
          rank = card['rank']

          if %w(A Q K J).include? rank
            5
          else
            0
          end
        end)
  end

  def sum(array)
    array.inject{|sum,x| sum + x}
  end
end
