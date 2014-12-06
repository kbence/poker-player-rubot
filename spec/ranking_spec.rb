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

    it 'should return 20 for pair' do
      Ranking.new.rank(cards('C9', 'D9')).should be(20)
    end

    it 'should return 30 for high pair' do
      Ranking.new.rank(cards('C10', 'D10')).should be(30)
    end

    it 'should return 40 for two pairs' do
      Ranking.new.rank(cards('C9', 'D9', 'S5', 'H5')).should be(40)
    end

    it 'should return 50 for three of a kind' do
      Ranking.new.rank(cards('C4', 'D4', 'D3', 'S4')).should be(50)
    end

    it 'should return 30 in case of flush chance' do
      Ranking.new.rank(cards('S5', 'S2', 'S3', 'D4', 'D6')).should be(30)
    end

    it 'should return 40 in case of almost flush' do
      Ranking.new.rank(cards('S5', 'S2', 'S3', 'S4', 'D6')).should be(40)
    end

    it 'should return 50 in case of almost flush' do
      Ranking.new.rank(cards('S5', 'S2', 'S3', 'S4', 'S6')).should be(50)
    end
  end
end
