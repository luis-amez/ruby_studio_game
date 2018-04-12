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

  def strong?
    @health > 100
  end

  def <=> (other_player)
    other_player.score <=> score
  end

  def print_name_and_health
    puts "#{@name} (#{@health})"
  end

  def print_name_and_score
    puts "#{@name.ljust(20, '.')} #{score}"
  end
end

if __FILE__ == $0
  player = Player.new("moe")
  puts player.name
  puts player.health
  player.w00t
  puts player.health
  player.blam
  puts player.health
end
