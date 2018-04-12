require_relative 'player'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game
  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players.push(player)
  end

  def play(rounds)
    puts "\nThere are #{@players.size} players in #{@title}:"
    puts @players

    treasures = TreasureTrove::TREASURES
    puts "\nThere are #{treasures.size} treasures to be found:"
    treasures.each do |treasure|
      puts "A #{treasure.name} is worth #{treasure.points} points!"
    end

    1.upto(rounds) do |round|
      # End the game if certain condition passed as a block to play is fullfilled
      if block_given?
        break if yield
      end
      puts "\nRound #{round}:"
      @players.each do |player|
        GameTurn.take_turn(player)
        puts player
      end
    end
  end

  def print_stats
    strong_players, wimpy_players = @players.partition { |player| player.strong? }

    puts "\n#{@title} Statistics:"

    puts "\n#{strong_players.size} strong players:"
    strong_players.each do |player|
      player.print_name_and_health
    end

    puts "\n#{wimpy_players.size} wimpy players:"
    wimpy_players.each do |player|
      player.print_name_and_health
    end

    puts "\n#{total_points} total points from treasures found"

    @players.each do |player|
      puts "\n#{player.name}'s point totals:"
      player.each_found_treasure do |treasure|
        puts "#{treasure.points} total #{treasure.name} points"
      end
      puts "#{player.points} grand total points"
    end

    puts "\n#{@title} High Scores:"
    @players.sort.each do |player|
      player.print_name_and_score
    end
  end

  def total_points
    @players.reduce(0) do |sum, player|
      sum + player.points
    end
  end
end
