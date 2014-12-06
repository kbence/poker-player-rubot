
class Ranking
  def rank(cards)
    value = 0
    cards.each do |card|
      rank = card['rank']

      if %w(A Q K J).include? rank
        value += 5
      end
    end

    value
  end
end
