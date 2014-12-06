require 'rspec'
require 'json'
require_relative '../ranking'

def card(str)
  JSON.parse "{
      \"suit\": \"#{{H: 'hearts', D: 'diamonds', C: 'clubs', S: 'spades'}[str[0].to_sym]}\",
      \"rank\": \"#{str[1..-1]}\"
  }"
end

def cards(*args)
  args.map { |c| card(c) }
end

describe 'Ranking' do
  describe 'rank' do
    it 'should return 0 for no hands' do
      Ranking.new.rank(cards('S4', 'C6')).should be(0)
    end

    it 'should return 10 for high cards' do
      Ranking.new.rank(cards('CA', 'DJ')).should be(10)
    end
  end
end
