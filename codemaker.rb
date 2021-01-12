module Codemaker
  

  $player = {
  "code" => [],
  "hint" => [],
  }

  $computer = {
  "code" => [],
  "previous_guesses" => [],
  "correct_colors" => [],
  "correct_place" => 0
  }


  def intro_cm()
    puts ""
    puts "0 = red"
    puts "1 = blue"
    puts "2 = green"
    puts "3 = yellow"
    puts "4 = black"
    puts "5 = white"
    puts ""

    puts "Very well - please designate the secret four digit code..."

    player_code = [gets.chomp]
    $player["code"] = player_code.join().split('').map { |value| value.to_i }
    puts $player["code"].inspect()
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
      #if number of correct colors < 4
      #change 1st digit of previous guess
      #if number of correct places increases - keep change and return out
      #if number of correct places decreases - change back to previous and return out
      #if number of correct places stays the same...not possible?
    
      #if number of correct colors = 4, different strategy
      #switch 1st digit with second digit
      #if correct places increases - keep change and return out
      #if correct places decreases - undo change and return out
      #if correct places remains the same... impossible
      
      #then repeat process with first and third - first and fourth, then use nested loop to try same process with 2nd digit (w 3rd and 4th digits) and then 3rd (3rd and 4th)

    end  


    
    #check for victory
    def check_win_cm()
      if $computer["code"] == $player["code"]
        puts "The computer cracked the code!"
        sleep(3)
        game()
      end  
    end  
    
    #add computer guess to previous guesses array
    $computer["previous_guesses"].push($computer["code"])
    
    #player gives hint based on computer's guess
    def give_hint()
      
      puts "hint..."

      correct_colors = []
      correct_place = 0

      $computer["code"].map { |value| if $player["code"].include?(value)
      correct_colors.push(value) 
      end }
      #update object
      $computer["correct_colors"] = correct_colors

      if correct_colors.length() > 0
      puts "#{correct_colors.length()} of the colors that the computer chose are accurate..."
      end  
  
      correct_colors.map { |value| $computer["code"].index(value) == $player["code"].index(value) }.map { |value| if value == true
      correct_place += 1
      end}

      $computer["correct_place"] = correct_place

      
      puts "... and #{correct_place} in the correct place" 
      
      sleep(2)

    end  
      

    def report_guess()
      if $computer["code"] != $player["code"]
        puts "The computer guessed #{$computer["code"].inspect()}"
        puts ""
        sleep(2)
        give_hint()
        puts ""
        sleep(2)
        puts "Guessing again..."
        puts ""
        game_cm_loop()
      end
    end

    check_win_cm()
    report_guess()

  end  


  def run_codemaker()
    intro_cm()
    game_cm_loop()
  end  



end  

