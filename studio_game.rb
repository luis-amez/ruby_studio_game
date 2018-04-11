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


class Player
  attr_accessor :name
  attr_reader :health

  def initialize(name, health = 100)
    @name = name.capitalize
    @health = health
  end

  def to_s
    "I'm #{@name} with a health of #{@health} and a score of #{score}."
  end

  def blam
    @health -= 10
    puts "#{@name} got blammed!"
  end

  def w00t
    @health += 15
    puts "#{@name} got w00ted!"
  end

  def score
    @name.length + @health
  end

  def name=(new_name)
    @name = new_name.capitalize
  end
end

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

# puts player1
# puts player2
# puts player2.name
# player2.name = "lawrence"
# puts player2.name
# puts player2.health
# puts player2.score
# puts player2
# puts player3
# player3.blam
# puts player3
# player3.w00t
# puts player3

# players = [player1, player2, player3]
# puts "There are #{players.size} players in the game"
# puts players

# players.each do |player|
#   puts player.health
# end

# players.each do |player|
#   player.blam
#   player.w00t
#   player.w00t
#   puts player
# end

knuckleheads = Game.new("Knuckleheads")
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.play
