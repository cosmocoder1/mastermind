module Codemaker
  

  $player = {
  "code" => [],
  "hint" => [],
  }

  $computer = {
  "code" => [],
  "previous_guesses" => [],
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
    $player["code"].push(player_code)
    $player["code"].map { |value| value.to_i }
    sleep(2)

    puts "Excellent!  The computer will now attempt to guess your code..."

    sleep(3)

  end


  def game_cm_loop()

    i = 0

    #first guess (random)
    if $computer["previous_guesses"].length() == 0
      while i < 4 do
        random_num = rand(6)
        if !$computer["code"].include?(random_num)
          $computer["code"].push(random_num)
          i += 1
        end  
      end 
    end  

    #other guesses (strategic)
    if $computer["previous_guesses"].length() > 0
    end  

    def check_win()
      if $computer["code"] == $player["code"]
        puts "The computer cracked the code!"
        sleep(3)
        game()
      end  
    end   
    
    def give_hint()
    end  
      

    def report_guess()
      if $computer["code"] != $player["code"]
        puts "The computer guessed #{$computer["code"].inspect()}"
        puts $player["code"].inspect()
        sleep(2)
        give_hint()
        puts "Guessing again..."
      end
    end

    check_win()
    report_guess()

  end  



  def run_codemaker()
    intro()
    game_cm_loop()
  end  



end  

