require_relative 'berserk_player'

describe BerserkPlayer do
  
  before do
    @initial_health = 50 
    @player = BerserkPlayer.new("berserker", @initial_health)
  end
  
  it "does not go berserk when blamed up to 3 times" do
    1.upto(3) { @player.blam }
    
    expect(@player.berserk?).to be_falsey
  end
  
  it "goes berserk when blamed more than 3 times" do
    1.upto(4) { @player.blam }
    
    expect(@player.berserk?).to be_truthy
  end
  
  it "gets w00ted instead of blammed when it's gone berserk" do  
    1.upto(3) { @player.blam }
    1.upto(3) { @player.blam }
    
    expect(@player.health).to eq(@initial_health - (3 * 10) + (3 * 15))
  end

end