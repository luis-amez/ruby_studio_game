require_relative 'player'

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
      player.blam
      player.w00t
      player.w00t
      puts player
    end
  end
end
