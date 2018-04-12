require_relative 'player'
require_relative 'treasure_trove'

class ClumsyPlayer < Player
  def found_treasure(treasure)
    damaged_treasure = Treasure.new(treasure.name, treasure.points / 2)
    super(damaged_treasure)
  end
end