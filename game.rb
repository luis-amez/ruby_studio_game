require_relative 'player'
require_relative 'game_turn'

class Game
  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players.push(player)
  end

  def play(rounds)
    puts "There are #{@players.size} players in #{@title}:"
    puts @players

    1.upto(rounds) do |round|
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
      puts "#{player.name} (#{player.health})"
    end

    puts "\n#{wimpy_players.size} wimpy players:"
    wimpy_players.each do |player|
      puts "#{player.name} (#{player.health})"
    end

    puts "\n#{@title} High Scores:"
    @players.sort.each do |player|
      puts "#{player.name.ljust(20, '.')} #{player.score}"
    end
  end
end
