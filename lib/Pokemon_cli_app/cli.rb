class CLI 

    def start
        system("clear")
        Pokemon.create_pokemon
    end

    def greeting    
        puts "Hello, I am Proffessor Oak! Welcome to Pokedex CLI!"
        puts "***************************************************"
        puts "There are #{Pokemon.all.length} pokemon in this Pokedex!"
        start_menu
    end

    def start_menu
        puts "-----------------------------------------------------------------------------"
        puts "Select an option from your Pokedex menu by entering the corresponding number!"
        puts "-----------------------------------------------------------------------------"
        puts "1. List of Gen I Pokemon."
        puts "2. List of Gen II Pokemon."
        puts "3. List of Gen III Pokemon."
        puts "4. List of Gen IV Pokemon."
        puts "5. List of Gen I - Gen IV Pokemon."
        puts "Type Exit to leave Pokedex."
        input = gets.strip
        if  input.to_i == 1 
            Pokemon.list_gen_I
            pokemon_list_menu(1, 151)
        elsif input.to_i == 2
            Pokemon.list_gen_II
            pokemon_list_menu(152, 251)
        elsif input.to_i == 3
            Pokemon.list_gen_III
            pokemon_list_menu(252, 386)
        elsif input.to_i == 4
            Pokemon.list_gen_IV
            pokemon_list_menu(387, 493)
        elsif input.to_i == 5
            Pokemon.list_all_pokemon
            pokemon_list_menu(1, 493)
        elsif input.downcase == "exit"
            abort("Goodbye!")
        else
            puts "Try to chose a number on the menu!"
            start_menu
        end
    end

    def pokemon_list_menu(range_start, range_end)
        puts "*********************************************************************************************"
        puts "Choose a Pokemon from the list by entering the corrisponding number to view their base stats."
        puts "*********************************************************************************************"
        puts "Or type main menu and hit enter to return to the main menu."
        puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
        input = gets.strip
        if input.to_i.between?(range_start, range_end)
            Pokemon.stats(input.to_i - 1)
            start_menu
        elsif input.downcase == "main menu"
            start_menu
        else
            puts "Sorry I do not have any information on that Pokemon please choose a Pokemon from the list."
            pokemon_list_menu(range_start, range_end)
        end
    end

end
