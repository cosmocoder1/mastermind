module Codebreaker

  $player = {
    "code" => []
    }
  $computer = {
      "code" => []
    }

  #computer secret code generator
  def generate_code()
    code = []
    i = 0
    while code.length < 4 do 
      random_num = rand(6)
      if !code.include?(random_num)
        code.push(random_num)
      end
    end 
    return code
  end

  
  def intro_cb()
    puts "Excellent!  I'm generating the secret code now..."
    sleep(2)
    $computer["code"] = generate_code()
  end  

  # check for winning code
  def check_win_cb()
        if $player["code"] == $computer["code"]
          puts "Congratulations - you cracked the code!"
          sleep(4)
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

  def analysis()
    puts ""
    puts "Your code is incorrect..."
    puts ""
    #compare computer code to user code 
    #first determine how many numbers match 
    correct_colors = []
    correct_place = 0

    $computer["code"].map { |value| if $player["code"].include?(value)
    correct_colors.push(value) 
    end }

    if correct_colors.length() > 0
      puts "although, #{correct_colors.length()} of the colors are accurate..."
    end  
  
    correct_colors.map { |value| $computer["code"].index(value) == $player["code"].index(value) }.map { |value| if value == true
  correct_place += 1
    end}
      
      puts "... and #{correct_place} in the correct place"  
  

    sleep(3)

  end


  def game_cb_loop()

      puts ""
      puts "0 = red"
      puts "1 = blue"
      puts "2 = green"
      puts "3 = yellow"
      puts "4 = black"
      puts "5 = white"
      puts ""


    puts "Please enter four numbers of the colors above to make your guess..."
      
      $player["code"] = gets.chomp.split('').map { |value| value.to_i }

      puts ""
      puts "You guessed"
      puts ""
      print $player["code"].map { |value| interpret(value) }
      puts ""
       
      check_win_cb()
      analysis()
      game_cb_loop()




    end 


  def run_codebreaker()
    intro_cb()
    game_cb_loop()
  end
  
end



