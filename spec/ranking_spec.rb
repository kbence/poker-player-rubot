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
      expect(Ranking.new.rank(cards('S4', 'C6'))).to eq(0)
    end

    it 'should return 10 for high cards' do
      expect(Ranking.new.rank(cards('CA', 'DJ'))).to eq(10)
    end

    it 'should return 20 for pair' do
      expect(Ranking.new.rank(cards('C9', 'D9'))).to eq(20)
    end

    it 'should return 30 for high pair' do
      expect(Ranking.new.rank(cards('C10', 'D10'))).to eq(30)
    end

    it 'should return 40 for two pairs' do
      expect(Ranking.new.rank(cards('C9', 'D9', 'S5', 'H5'))).to eq(60)
    end

    it 'should return 50 for three of a kind' do
      expect(Ranking.new.rank(cards('C4', 'D4', 'D3', 'S4'))).to eq(50)
    end

    it 'should return 40 in case of almost flush' do
      expect(Ranking.new.rank(cards('S5', 'S2', 'S3', 'S4', 'D6'))).to eq(60)
    end

    it 'should return 50 in case of almost flush' do
      expect(Ranking.new.rank(cards('S5', 'S2', 'S3', 'S4', 'S6'))).to eq(100)
    end
  end


  # describe 'permute' do
  #   it 'should return our only two cards' do
  #     expect(Ranking.new.permute(cards('S1', 'S2'))).to eq([cards('S1', 'S2')])
  #   end
  #
  #   it 'should return one combination for up to five cards' do
  #     expect(Ranking.new.permute(cards('S1', 'S2', 'S3', 'S4', 'S5'))).to eq([cards('S1', 'S2', 'S3', 'S4', 'S5')])
  #   end
  #
  #   it 'should return one combination for up to five cards' do
  #     expect(Ranking.new.permute(cards('S1', 'S2', 'S3', 'S4', 'S5', 'S6'))).to eq([
  #        cards('S1', 'S2', 'S3', 'S4', 'S5'),
  #        cards('S1', 'S2', 'S4', 'S5', 'S6'),
  #     ])
  #   end
  # end

  describe 'choose' do
    it 'should return the only combination for less than expected' do
      expect(Ranking.new)
    end
  end
end
