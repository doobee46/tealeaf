require 'colorize'
require './bank_account'
module Run
    include Transaction
    loop do 
        puts"-----------------------------------"
        puts"   Welcome to Bank of Trust        ".blue
        puts"-----------------------------------"
        puts"\n"
        puts"--------------Menu-----------------"
        puts"1)Open an Account"
        puts"2)View Balance "
        puts"3)Make Transaction"
        puts"4)View Transaction"
        puts"5)Change Pin" 
        puts"6)Exit"
        puts"-----------------------------------"
        puts"\n"
        puts"Choose from the menu above:".red
        ans = gets.chomp.to_i
            if (1..6).include?(ans) 
            else
                puts"Incorrect selection"
                break                        
            end

        case ans
        when 1
            info = {}
            puts"\n"
            puts"-----------------------------------"
            puts"Let's gets started".yellow
            puts"-----------------------------------"
            puts"   Account Opening Questions       ".blue
            puts"-----------------------------------"
            puts"-----------------------------------"
            puts"What is your first name?:".yellow
                first_name = gets.chomp              
                info[:first_name] = first_name
            puts"-----------------------------------"
            puts"What is your last name? :".yellow
                last_name = gets.chomp
                info[:last_name] = last_name
            puts"-----------------------------------"
            puts"Please enter your address? :".yellow
                address = {}
                info[:address]= address
            puts"-----------------------------------"
            puts"what is the street? :".yellow
                street = gets.chomp
                address[:street] = street
            puts"-----------------------------------"
            puts"what is the city?:".yellow
                city = gets.chomp
                address[:city] = city
            puts"-----------------------------------"
            puts"what is the zipcode?:".yellow
                zip_code = gets.chomp.to_i
                address[:zip_code] = zip_code

                if (11410..12000).cover?(zip_code)
                    address[:county] = "New York"
                else 
                    puts "Unfortunately we don't serve your community yet"
                    exit
                end
            
                if !info.nil?
                    @account = BankAccount.new(info)
                    puts"-----------------------------------"
                    puts"\n"
                    puts"Account has been successfully created".yellow
                    puts"Your Account number is #{account_number}".blue
                    puts"your balance is #{balance}".red
                    puts"\n"
                    @account.save()
                else 
                    puts "unable to create account at this time"
                    break
                end
        when 2
            puts "in construction"
        when 3
            loop do
                puts"\n"
                puts "What do you want to do today?"
                puts"-----------------------------------"
                puts"1)Deposit  2)Withdrawal 3)Transfer 4)Balance 5)Exit"
                print"your choice :"
                ans = gets.chomp.to_i
                case ans 
                when 1
                    puts"\n"
                                 
                when 5
                    break
                end 
                    
            end
        when 4
            puts BankAccount.account_list
        when 5
             puts "in construction"
        when 6
            break
        end
        
    end
     
end
