require_relative 'player'
require_relative 'game'
require_relative 'clumsy_player'
require_relative 'berserk_player'

gotham = Game.new("Gotham")
gotham.load_players(ARGV.shift || "players.csv")
jason = ClumsyPlayer.new("Jason", 100)
joker = BerserkPlayer.new("Joker", 90)
gotham.add_player(jason)
gotham.add_player(joker)

loop do
  puts "\nHow many game rounds? ('quit' to exit)"
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/
    gotham.play(answer.to_i) do
      gotham.total_points >= 10000
    end
  when "quit", "exit"
    gotham.print_stats
    break
  else
    puts "Please enter a number or 'quit'"
  end
end

gotham.save_high_scores
