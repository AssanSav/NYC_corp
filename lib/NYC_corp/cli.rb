class  NYCCorp::CLI 

    def call 
        puts "Welcome to NYC 50 Best rated Coporations".colorize(:green)
        input = nil 
        until input == "exit" 
            puts "Type 'corp' to display companies".colorize(:yellow)
            puts "Type 'menu' to dysplay all Companies".colorize(:yellow)
            
       
        input = gets.strip.downcase
        case input 
            when "corp"
                listBy_name
            when "menu"
                listAll_Corp
            when "number"
                listBy_number
            when "exit"
            puts "GOODBYE"
                 exit
            else 
                puts "WOOPS! invalid input Type corp or Number First or 'exit' to exit".colorize(:green)
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
            puts "Domaine: #{corp.domaine.colorize(:red)}" 
            puts "Rating: #{corp.rating.colorize(:red)}" 
            puts "Summary: #{corp.summary}"
            puts "Link: #{corp.link.colorize(:red)}\n\n"
        end
    end

    def listBy_number
        puts "Enter 1 to 50".colorize(:green)  
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

