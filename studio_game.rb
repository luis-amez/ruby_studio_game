player_first = "larry"
health_first = 60
player_second = "curly"
health_second = 125
player_third = "moe"
health_third = 100
player_fourth = "shemp"
health_fourth = 90

def say_hello(name, health = 100)
  "I'm #{name.capitalize} with a health of #{health} as of #{time}."
end

def time
  now = Time.new
  now.strftime("%I:%M:%S")
end

puts say_hello(player_first, health_first)
puts say_hello(player_second, health_second)
puts say_hello(player_third)
puts say_hello(player_fourth, health_fourth)
