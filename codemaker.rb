module Codemaker
  

  $player = {
  "code" => [],
  }

  $computer = {
  "code" => []
  "previous_guesses" => []
  }


  def intro()
    puts ""
    puts "0 = red"
    puts "1 = blue"
    puts "2 = green"
    puts "3 = yellow"
    puts "4 = black"
    puts "5 = white"
    puts ""

    puts "Very well - please designate the secret four digit code..."

    player_code = gets.chomp
    $player["code"].push(player_code).join().split('').map { |value| value.to_i }
    sleep(2)

    puts "Excellent!  The computer will now attempt to guess your code..."

    sleep(3)

  end


  def game_cm_loop()

    i = 0

    #first guess (random)
    if $computer["previous_guesses"].length() == 0
      while i < 5 do
        random_num = rand(6)
        if !$computer["code"].include?(random_num)
          $computer["code"].push(random_num)
          i += 1
        end  
      end 
    end  
  end

  def report_guess()
    if $computer["code"] != $player["code"]
    puts "The computer guessed #{$computer["code"].inspect()}"
    sleep(2)
    puts "Guessing again..."
    end
  end  

  def run_codemaker()
    intro()
    game_cm_loop()
  end  



end  

