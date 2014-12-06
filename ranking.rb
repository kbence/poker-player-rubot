
class Ranking
  def rank(cards)
    value = 0
    value += rank_cards(cards)

    value
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
