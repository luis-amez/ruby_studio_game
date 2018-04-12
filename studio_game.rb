require_relative 'player'
require_relative 'game'

gotham = Game.new("Gotham")
gotham.load_players(ARGV.shift || "players.csv")

loop do
  puts "\nHow many game rounds? ('quit' to exit)"
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/
    gotham.play(answer.to_i) do
      gotham.total_points >= 2000
    end
  when "quit", "exit"
    gotham.print_stats
    break
  else
    puts "Please enter a number or 'quit'"
  end
end

gotham.save_high_scores
