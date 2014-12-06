require 'rspec'
require_relative '../player'
require 'json'

describe 'Player' do
  describe 'bet_request' do
    it 'should return an int' do
      player = Player.new
      game_state = JSON.parse('{
          "players":[
          {"name":"Player 1",
          "stack":1000,
          "status":"active",
          "bet":0,
          "hole_cards":[],
          "version":"Version name 1",
          "id":0
      },
          {"name":"Rubot",
          "stack":1000,
          "status":"active",
          "bet":0,
          "hole_cards":[
            {
              "rank": "6",
              "suit": "hearts"
            },
            {
              "rank": "K",
              "suit": "spades"
            }
          ],
          "version":"Version name 2",
          "id":1
      }
      ],
          "small_blind":10,
          "orbits":0,
          "dealer":0,
          "community_cards":[],
          "current_buy_in":0,
          "pot":0
      }')
      expect(player.bet_request(game_state)).is_a? Integer
    end

    it 'should return 125 for a king' do
      player = Player.new
      game_state = JSON.parse('{
          "players":[
          {"name":"Player 1",
          "stack":1000,
          "status":"active",
          "bet":0,
          "hole_cards":[],
          "version":"Version name 1",
          "id":0
      },
          {"name":"Rubot",
          "stack":1000,
          "status":"active",
          "bet":0,
          "hole_cards":[
            {
              "rank": "6",
              "suit": "hearts"
            },
            {
              "rank": "K",
              "suit": "spades"
            }
          ],
          "version":"Version name 2",
          "id":1
      }
      ],
          "small_blind":10,
          "orbits":0,
          "dealer":0,
          "community_cards":[],
          "current_buy_in":0,
          "pot":0
      }')
      expect(player.bet_request(game_state)).to eq(125)
    end

    it 'should return 250 for an Ace and King' do
      player = Player.new
      game_state = JSON.parse('{
          "players":[
          {"name":"Player 1",
          "stack":1000,
          "status":"active",
          "bet":0,
          "hole_cards":[],
          "version":"Version name 1",
          "id":0
      },
          {"name":"Rubot",
          "stack":1000,
          "status":"active",
          "bet":0,
          "hole_cards":[
            {
              "rank": "A",
              "suit": "hearts"
            },
            {
              "rank": "K",
              "suit": "spades"
            }
          ],
          "version":"Version name 2",
          "id":1
      }
      ],
          "small_blind":10,
          "orbits":0,
          "dealer":0,
          "community_cards":[],
          "current_buy_in":0,
          "pot":0
      }')
      expect(player.bet_request(game_state)).to eq(250)
    end
  end
end
