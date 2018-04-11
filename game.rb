require_relative 'player'
require_relative 'die'

class Game
  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players.push(player)
  end

  def play
    puts "There are #{@players.size} players in #{@title}:"
    puts @players

    @players.each do |player|
      die = Die.new
      number_rolled = die.roll

      case number_rolled
      when 5..6
        player.w00t
      when 3..4
        puts "#{player.name} was skipped."
      when 1..2
        player.blam
      end
      puts player
    end
  end
end
