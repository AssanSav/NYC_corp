class  NYCCorp::CLI 

    def call 
            input = nil 
        until input == "exit" 
            puts "\nWelcome to NYC 50 Best Highly rated CORPORATIONS".colorize(:blue)
            puts "Type 'MENU' to display companies".colorize(:yellow)
            puts "Type 'ALL' to dysplay all Companies".colorize(:yellow)
            puts "Type 'NUMB' to choose between 1 & 50".colorize(:yellow)
            
            input = gets.strip.downcase
        case input 
            when "menu"
                listBy_name
            when "all"
                listAll_Corp
            when "numb"
                listBy_number
            when "exit"
            puts "GOODBYE & THANKS FOR YOUR BUSINESS!".colorize(:blue)
                 exit
            else 
            puts "WOOPS! Didin't understand!!!".colorize(:green)
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
        puts "\nEnter 1 to 50".colorize(:green)  
        input = gets.strip.to_i
    if (1..NYCCorp::Company.all.size).include?(input) && input <= NYCCorp::Company.all.size && input != nil
        selection = NYCCorp::Company.all.each {|corp| corp}[input - 1]
        puts "Name: #{selection.name.colorize(:red)}"
        puts "Domaine: #{selection.domaine.colorize(:red)}"
        puts "Rating: #{selection.rating.colorize(:red)}"  
        puts "Summary: #{selection.summary.colorize(:red)}"
        puts "Link: #{selection.link.colorize(:red)}"
        else 
        listBy_number
        end
    end

end