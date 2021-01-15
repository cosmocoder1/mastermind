require_relative 'codebreaker'
require_relative 'codemaker'

include Codebreaker
include Codemaker

def game()

  system("clear")

  player = {
  "player_type" => "",
  "secret_code" => ""
  }

  computer = {
  "secret_code" => ""
  }

  puts "Are you the codemaker..."
  sleep(1)
  puts "...or the codebreaker?"
  $player_type = gets.chomp
  if $player_type != "codemaker" || "codebreaker"
    puts "error - please enter either codemaker or codebreaker"
    $player_type = gets.chomp
  end  
  player["player_type"] = $player_type

  if player["player_type"] == "codemaker"
      Codemaker.run_codemaker()
    else
      Codebreaker.run_codebreaker()
  end

end  

game()


