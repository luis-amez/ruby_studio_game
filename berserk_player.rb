require_relative 'player'

class BerserkPlayer < Player
  def initialize(name, health = 100)
    super(name, health)
    @blam_count = 0
  end

  def berserk?
    @blam_count > 3
  end

  def blam
    @blam_count += 1
    if berserk?
      puts "Blamed? You can't hurt #{@name} in berserk mode!"
      w00t
    else
      super
    end
  end
end