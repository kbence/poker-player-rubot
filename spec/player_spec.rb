require 'rspec'
require_relative '../player'
require 'json'

BET_MULTIPLIER = 10

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
      expect(player.bet_request(game_state)).to eq(5 * BET_MULTIPLIER)
    end

    it 'should return 50 for a J, three of the same suite' do
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
              "rank": "J",
              "suit": "spades"
            },
            {
              "rank": "6",
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
          "community_cards":[            {
              "rank": "7",
              "suit": "spades"
            }],
          "current_buy_in":0,
          "pot":0
      }')
      expect(player.bet_request(game_state)).to eq(5 * BET_MULTIPLIER)
    end


    it 'should return 250 for a Jack and six in hand, six on the table' do
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
              "rank": "J",
              "suit": "spades"
            },
            {
              "rank": "6",
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
          "community_cards":[{
              "rank": "6",
              "suit": "diamonds"
            }],
          "current_buy_in":0,
          "pot":0
      }')
      expect(player.bet_request(game_state)).to eq(25 * BET_MULTIPLIER)
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
      expect(player.bet_request(game_state)).to eq(10 * BET_MULTIPLIER)
    end

    it 'should return 500 for a pair of fours' do
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
              "rank": "4",
              "suit": "hearts"
            },
            {
              "rank": "5",
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
          "community_cards":[
            {
              "rank": "9",
              "suit": "hearts"
            },
            {
              "rank": "4",
              "suit": "spades"
            },
            {
              "rank": "6",
              "suit": "spades"
            }],
          "current_buy_in":0,
          "pot":0
      }')
      expect(player.bet_request(game_state)).to eq(20 * BET_MULTIPLIER)
    end

    it 'should return 550 for a pair of fours and a King' do
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
              "rank": "4",
              "suit": "hearts"
            },
            {
              "rank": "5",
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
          "community_cards":[
            {
              "rank": "9",
              "suit": "hearts"
            },
            {
              "rank": "4",
              "suit": "spades"
            },
            {
              "rank": "K",
              "suit": "spades"
            }],
          "current_buy_in":0,
          "pot":0
      }')
      expect(player.bet_request(game_state)).to eq(20 * BET_MULTIPLIER)
    end

    it 'should return 800 for a triple' do
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
              "rank": "4",
              "suit": "hearts"
            },
            {
              "rank": "5",
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
          "community_cards":[
            {
              "rank": "9",
              "suit": "hearts"
            },
            {
              "rank": "4",
              "suit": "spades"
            },
            {
              "rank": "4",
              "suit": "spades"
            }],
          "current_buy_in":0,
          "pot":0
      }')
      expect(player.bet_request(game_state)).to eq(50 * BET_MULTIPLIER)
    end

    it 'should return 1000 for a flush' do
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
              "rank": "4",
              "suit": "spades"
            },
            {
              "rank": "5",
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
          "community_cards":[
            {
              "rank": "9",
              "suit": "spades"
            },
            {
              "rank": "4",
              "suit": "spades"
            },
            {
              "rank": "4",
              "suit": "spades"
            }],
          "current_buy_in":0,
          "pot":0
      }')
      expect(player.bet_request(game_state)).to eq(100 * BET_MULTIPLIER)
    end

    # it 'should return blah for a straight flush' do
    #   player = Player.new
    #   game_state = JSON.parse('{
    #       "players":[
    #       {"name":"Player 1",
    #       "stack":1000,
    #       "status":"active",
    #       "bet":0,
    #       "hole_cards":[],
    #       "version":"Version name 1",
    #       "id":0
    #   },
    #       {"name":"Rubot",
    #       "stack":1000,
    #       "status":"active",
    #       "bet":0,
    #       "hole_cards":[
    #         {
    #           "rank": "4",
    #           "suit": "spades"
    #         },
    #         {
    #           "rank": "5",
    #           "suit": "spades"
    #         }
    #       ],
    #       "version":"Version name 2",
    #       "id":1
    #   }
    #   ],
    #       "small_blind":10,
    #       "orbits":0,
    #       "dealer":0,
    #       "community_cards":[
    #         {
    #           "rank": "6",
    #           "suit": "spades"
    #         },
    #         {
    #           "rank": "7",
    #           "suit": "spades"
    #         },
    #         {
    #           "rank": "8",
    #           "suit": "spades"
    #         }],
    #       "current_buy_in":0,
    #       "pot":0
    #   }')
    #   expect(player.bet_request(game_state)).to eq(100 * BET_MULTIPLIER)
    # end

    # it 'should return blah for a straight' do
    #   player = Player.new
    #   game_state = JSON.parse('{
    #       "players":[
    #       {"name":"Player 1",
    #       "stack":1000,
    #       "status":"active",
    #       "bet":0,
    #       "hole_cards":[],
    #       "version":"Version name 1",
    #       "id":0
    #   },
    #       {"name":"Rubot",
    #       "stack":1000,
    #       "status":"active",
    #       "bet":0,
    #       "hole_cards":[
    #         {
    #           "rank": "4",
    #           "suit": "hearts"
    #         },
    #         {
    #           "rank": "5",
    #           "suit": "spades"
    #         }
    #       ],
    #       "version":"Version name 2",
    #       "id":1
    #   }
    #   ],
    #       "small_blind":10,
    #       "orbits":0,
    #       "dealer":0,
    #       "community_cards":[
    #         {
    #           "rank": "6",
    #           "suit": "hearts"
    #         },
    #         {
    #           "rank": "7",
    #           "suit": "spades"
    #         },
    #         {
    #           "rank": "8",
    #           "suit": "spades"
    #         }],
    #       "current_buy_in":0,
    #       "pot":0
    #   }')
    #   expect(player.bet_request(game_state)).to eq(80 * BET_MULTIPLIER)
    # end

  end
end
