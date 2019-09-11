class  NYCCorp::CLI 

    def call 
            @input = nil 
        until @input == "exit" 
            puts "\nWelcome to NYC 50 Best Highly rated CORPORATIONS".colorize(:blue)
            puts "Type 'MENU' to display companies".colorize(:yellow)
            puts "Type 'ALL' to dysplay all Companies".colorize(:yellow)
            puts "Type 'EXIT' to exit".colorize(:yellow)
            
            @input = gets.strip.downcase
        case @input 
            when "menu"
                listBy_name
            when "all"
                listAll_Corp
            when "exit"
            puts "GOODBYE & THANKS FOR YOUR BUSINESS!".colorize(:blue)
                 exit
            else 
            puts "WOOPS! Didin't understand!!!".colorize(:red)
            call
            end
        end
    end 


    def listBy_name
        NYCCorp::Company.all.each.with_index(1) do |corp, index|
            puts "#{index}. #{corp.name.colorize(:blue)}"
        end
        listBy_number
    end


    def listAll_Corp
        NYCCorp::Company.all.each.with_index(1) do |corp, index|
            puts "#{index}. #{corp.name.colorize(:blue)}"
            puts "Domaine:#{corp.domaine.colorize(:red)}" 
            puts "Rating: #{corp.rating.colorize(:red)}" 
            puts "Summary: #{corp.summary}"
            puts "Link: #{corp.link.colorize(:red)}\n\n"
        end
    end


    def listBy_number
        puts "\nEnter 1 to 50 or Exit to MENU".colorize(:green) 
        @input = gets.strip
        choice = @input.to_i
    if (1..NYCCorp::Company.all.size).include?(choice) && choice <= NYCCorp::Company.all.size && @choice != "exit"
        selection = NYCCorp::Company.all.each {|corp| corp}[choice- 1]
        puts "Name: #{selection.name.colorize(:red)}"
        puts "Domaine: #{selection.domaine.colorize(:red)}"
        puts "Rating: #{selection.rating.colorize(:red)}"  
        puts "Summary: #{selection.summary.colorize(:red)}"
        puts "Link: #{selection.link.colorize(:red)}"
        checker
        else 
            puts "WOOPS! Wrong TYPO...".colorize(:red)
        call
        end
    end

    def checker 
        #puts "What would you like to see"
        listBy_number
        listBy_name
        listAll_Corp
    end

end