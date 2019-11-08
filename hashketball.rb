# Write your code here!
def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {
          :player_name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
          },
        {
          :player_name => "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
          },
          {
            :player_name => "Brook Lopez",
            :number => 11,
            :shoe => 17,
            :points => 17,
            :rebounds => 19,
            :assists => 10,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 15
          },
          {
            :player_name => "Mason Plumlee",
            :number => 1,
            :shoe => 19,
            :points => 26,
            :rebounds => 11,
            :assists => 6,
            :steals => 3,
            :blocks => 8,
            :slam_dunks => 5
          },
          {
            :player_name => "Jason Terry",
            :number => 31,
            :shoe => 15,
            :points => 19,
            :rebounds => 2,
            :assists => 2,
            :steals => 4,
            :blocks => 11,
            :slam_dunks => 1
          }
      ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {
          :player_name => "Jeff Adrien",
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        {
          :player_name => "Bismack Biyombo",
          :number     => 0,
          :shoe       => 16,
          :points     => 12,
          :rebounds   => 4,
          :assists    => 7,
          :steals     => 22,
          :blocks     => 15,
          :slam_dunks => 10
        },
        {
          :player_name => "DeSagna Diop",
          :number     => 2,
          :shoe       => 14,
          :points     => 24,
          :rebounds   => 12,
          :assists    => 12,
          :steals     => 4,
          :blocks     => 5,
          :slam_dunks => 5
        },
        {
          :player_name => "Ben Gordon",
          :number     => 8,
          :shoe       => 15,
          :points     => 33,
          :rebounds   => 3,
          :assists    => 2,
          :steals     => 1,
          :blocks     => 1,
          :slam_dunks => 0
        },
        {
          :player_name => "Kemba Walker",
          :number     => 33,
          :shoe       => 15,
          :points     => 6,
          :rebounds   => 12,
          :assists    => 12,
          :steals     => 7,
          :blocks     => 5,
          :slam_dunks => 12
        }
      ]
    }
  }
end

def num_points_scored(player_name)
  game_hash.each { |team_key, team_value|
      #print "Team key:"
      #pp(team_key)
      #print "Team value:"
      #pp(team_value)
    team_value[:players].each { |player|
      if player[:player_name] == player_name
        player[:points].to_i
        return player[:points]
      end
    }
  }
end

def shoe_size(player_name)
  playas = get_all_players(game_hash)
  my_guy = get_player_in_array_by_name(player_name, playas)
  my_guy[:shoe]
end

def get_all_players(game) #returns AoH's of all players in the game
  result = []

    game.each { |home_or_away, team|
      team[:players].each { |player_hash|
        result.push(player_hash)
      }
    }


  #puts "All player hashes: #{result}"
  result
end

def get_player_in_array_by_name(player_name, player_array) # retreives player hash from AoH
  player_array.each { |player|
    #puts player[:player_name]
    if player[:player_name] == player_name
      #puts player[:player_name]
      return player
    end
  }
  puts "Player not found"
  nil
end

def team_colors(team_name)
  get_team(team_name, game_hash)[:colors]
end

def get_team(team_name, hash) # returns specified team hash
  hash.each{ |team_key, team_val|
    if team_val[:team_name] == team_name
      puts
      return team_val
    end
  }
  puts "Team not found."
  nil
end

def team_names
  result = []
  game_hash.each { |team_key, team_val|
    result.push(team_val[:team_name])
  }
  result
end

def player_numbers(team_name)
  result = []
    team_players = get_team(team_name, game_hash)[:players]
    team_players.each { |player|
      result.push(player[:number])
    }
    result
end

def player_stats(player_name)
  player = get_player_in_array_by_name(player_name, get_all_players(game_hash)).tap{|h| h.delete(:player_name)}
end

def big_shoe_rebounds
  players = get_all_players(game_hash)
  #puts "All players:"
  #puts players
  big_shoe_guy = players.reduce{ |memo, player|
      if player[:shoe] > memo[:shoe]
        memo = player
      end
      memo
      }
  puts big_shoe_guy[:rebounds]
  big_shoe_guy[:rebounds]
end

def most_points_scored
  players = get_all_players(game_hash)
  players.reduce{ |memo, player|
    if player[:points] > memo[:points]
      memo = player
    end
    memo
  }[:player_name].to_s
end

def winning_team
  home_score = get_team_total(game_hash[:home][:team_name])
  away_score = get_team_total(game_hash[:away][:team_name])
  if home_score > away_score
    return game_hash[:home][:team_name].to_s
  else
    return game_hash[:away][:team_name].to_s
  end
end

def get_teams

  game_hash.each{ |team, value|

  }
end

def get_team_total(team)
  t = get_team(team, game_hash)
  t.each{ |key, val|
  team_total = val[:players].reduce(0){ |sum, player|
    #puts "Player: #{player[:player_name]}"
    sum = sum + player[:points]
    #puts "Sum for team: #{sum}, #{val[:team_name]}"
    sum
  }
  }
  puts "Team total for #{team}: #{team_total}"
  team_total
end
