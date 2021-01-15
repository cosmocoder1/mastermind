module Codemaker
  
  $player = {
  "code" => [],
  "hint" => [],
  }

  $computer = {
  "code" => [],
  "previous_guess" => [],
  "correct_colors" => [],
  "correct_place" => 0
  }

  $guess_loop = 0

  def intro_cm()

    puts ""
    puts "0 = red"
    puts "1 = blue"
    puts "2 = green"
    puts "3 = yellow"
    puts "4 = black"
    puts "5 = white"
    puts ""

    puts "Very well - please designate the secret four digit code with no duplicates..."

    player_code = gets.chomp.split('')
    $player["code"] = player_code.map { |value| value.to_i() }
    puts $player["code"].map { |num| interpret(num) }.inspect()
    puts ""
    sleep(2)

    puts "Excellent!  The computer will now attempt to guess your code..."

    sleep(3)

  end

  def game_cm_loop()
    
    i = 0 

    $computer["code"] = []

    #computer guess (random)
      while $computer["code"].length < 4 do
        random_num = rand(6)
        unless $computer["code"].include?(random_num) 
          $computer["code"].push(random_num)
          i += 1
        end  
          $computer["code"] = $computer["code"].map { |value| value.to_i() }
      end 
    
    #update previous_guess
    $computer["previous_guess"].push($computer["code"].join().to_s())

    #12 turn game counter
    $guess_loop += 1

    if $guess_loop > 12
      puts "The computer failed to guess your code!"
      sleep(3)
      system("clear")
      game()
    end    

    #check for victory
    def check_win_cm()
      if $computer["code"] == $player["code"]
        puts "The computer cracked the code!"
        sleep(3)
        game()
      end  
    end  

    #translate numbers to colors
  def interpret(num) 
    case num
      when 0
        "red"
      when 1
        "blue"
      when 2
        "green"
      when 3
        "yellow"
      when 4
        "black"
      when 5
        "white" 
      end
    end    
    
    #player gives hint based on computer's guess
    def give_hint()
      
      sleep(2)
      puts "hint..."
      sleep(1)

      correct_colors = []
      correct_place = 0

      #count matching colors
      $computer["code"].map { |value| if $player["code"].include?(value)
        if !correct_colors.include?(value)
          correct_colors.push(value) 
        end
      end }

      #update object
      $computer["correct_colors"] = correct_colors

      #report matching colors 
      if correct_colors.length() > 0
        puts "#{correct_colors.length()} of the colors that the computer chose are accurate..."
      end  
      
      #count matching placement of matching colors
      correct_colors.map { |value| $computer["code"].index(value) == $player["code"].index(value) }.map { |value| if value == true
      correct_place += 1
      end}

      #update object
      $computer["correct_place"] = correct_place

      puts "... and #{correct_place} in the correct place" 
      
      sleep(3)

    end
      
    def report_guess()
      if $computer["code"] != $player["code"]
        puts "The computer guessed #{$computer["code"].map { |num| interpret(num) }.inspect()}"
        puts ""
        sleep(2)
        give_hint()
        puts ""
        sleep(2)
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

