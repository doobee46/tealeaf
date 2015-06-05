require 'pry'
require 'yaml'
require 'colorize'

class Person
    attr_accessor :info

    def initialize(info={})
        @info = info
    end

    def change_info(info={})
        self.info = info
    end

    def full_name
        full_name =info[:first_name]
    if !@middle_name.nil?
        full_name += " "
        full_name += info[:middle_name]
    end
        full_name += ' '
        full_name += info[:last_name]
        full_name
    end

end


class BankAccount < Person
     
    attr_accessor :balance, :pin
    @@count = 0
    @@account_list = []

    def initialize(balance)
        super
        @info[:transaction]={}
        @info[:transaction][:deposit]=[]
        @info[:transaction][:withdrawal]=[]
        @info[:account_number] = @@count += 1
        @info[:balance]=10000
        @info[:pin]= 0
    end

    def open
        if File.exist?("bank_account.yml")
          @@account_list = YAML.load_file("bank_account.yml")
        end
      end

    def save
        File.open("bank_account.yml", "w") do |file|
          file.write(@@account_list.to_yaml)
        end
      end

    def set_pin(number)
        self.info[:pin] = number
        puts"-----------------------------------"
        puts "Your pin was successfully changed "
        puts"-----------------------------------"
    end

    def self.account_list
        puts"---------------------------------"
        puts"       Accounts Lists            "
        puts"---------------------------------"
        @@account_list.each do |account|
            puts "#{account[:account_number]} | $#{account[:balance]}"
            puts"---------------------------------"
        end
    end
    
    def self.create_account
           
    end

   #contains all the operation need to manage a bank
   def self.get_balance(acct_num, pin)
        #search for the corresponding account in the account_list 
        @@account_list.each do |account|
            if account[:account_number] == acct_num && account[:pin] == pin           
        # return balance  for each new object
           puts"-----------------------------------"
           puts"      Accounts balance - #{account[:account_number]}"
           puts"-----------------------------------"
           puts "Your actual balance is $#{account[:balance]}".red
           puts"-----------------------------------"
           else
           puts" No account found "
          end
        end  
    end 

    def self.make_deposit(acct_num,pin,amount)
        @@account_list.each do |account|
            if account[:account_number] == acct_num && account[:pin] == pin 
        #add amount to the balance and return the aggregated amount 
        depo_trans = account[:balance] += amount
        account[:transaction][:deposit].push(amount)
            else
                puts"Deposit aborted"
                exit
            end
        end
        
    end

   def self.make_withdrawal(acct_num,pin,amount)
       @@account_list.each do |account|
            if account[:account_number] == acct_num && account[:pin] == pin 
        #add amount to the balance and return the aggregated amount 
        depo_withdrawal = account[:balance] -= amount
        account[:transaction][:withdrawal].push(amount)
            elsif account[:balance] > amount
                    puts"Unsufficient funds for withdrawal".red
                    puts"make some deposits".red
            else
                puts"withdrawal aborted"
                exit
            end
       end
    end 

def self.transac_info
        count = 0
        transac_counter = count += 1
        puts"--------------------------------"
        puts"  Transaction Lists-#{@info[:first_name]}        "
        puts"---------------------------------"
        puts "Debit   |  Credit  |  No-Trans  "
        puts"-----------Deposit---------------"
        all=@deposit.each{|trans| puts "$#{trans}"}
        puts"Total deposit"
        total=all.sum
        puts"$#{total}"
        puts"-------------withdrawal----------"
        less=@withdrawal.each{|withd| puts "$#{withd}"}
        diff =less.sum
        puts "Total withdrawal"
        puts"$#{diff}"
        puts"-----------Bank Balance----------"
        bank_bal = total + diff 
        puts "$#{bank_bal}"
    end


def transfer( account_origin,account_dest,pin, amount)
        origin = @info[:balance]
        @@account_list.each do |list|
            if account_number == list[:account_number] && list[:pin] == pin
                if amount > origin
                    puts "Low balance "
                    exit
                else origin > amount
                    trans = list[:balance] += amount
                    @deposit.push(amount)
                    self.withdrawal(amount)
                    puts"Transfer complete"
                end
            end
        end
    end
    
      
     loop do 
        puts"-----------------------------------"
        puts"   Welcome to Bank of Trust        ".blue
        puts"-----------------------------------"
        puts"\n"
        puts"--------------Menu-----------------"
        puts"1)Open an Account"
        puts"2)Make Transaction"
        puts"3)View Transaction"
        puts"4)Change Pin" 
        puts"5)Exit"
        puts"-----------------------------------"
        puts"\n"
        puts"Choose from the menu above:".red
            ans = gets.chomp.to_i
            select=(1..6)
            unless select.include?(ans) 
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

                if (11410..15000).cover?(zip_code)
                    address[:county] = 'New York'
                else 
                    puts "Unfortunately we don't serve your community yet"
                    exit
                end
                 if  !info.nil?
                     @account = BankAccount.new(info)
                     @account.save
                     @@account_list.push(info)
                        puts"-----------------------------------"
                        puts"\n"
                        puts"Account has been successfully created".yellow
                        puts"Your Account number is #{info[:account_number]}".blue
                        puts"your balance is #{info[:balance]}".red
                        p @@account_list
                        puts"\n"
                        puts"-----------------------------------"
                   
                else 
                    puts "unable to create account at this time"
                    exit
                end
                 
               
            when 2
                loop do
                    puts"\n"
                    puts"----------------------------------------------------"
                    puts "What do you want to do today?".yellow
                    puts"----------------------------------------------------"
                    puts"\n"
                    puts"1)Deposit  2)Withdrawal 3)Transfer 4)Balance 5)Exit"
                    puts"\n"
                    print"your choice :"
                    ans = gets.chomp.to_i
                    case ans 
                    when 1
                        puts"-----------------------------------"
                        puts"\n"
                        puts "Please enter Account number:".blue
                        acct_num = gets.chomp.to_i
                        puts"Please enter pin:".blue
                        pin = gets.chomp.to_i
                        puts "Deposit Amount :".blue
                        amount =gets.chomp.to_i
                        BankAccount.make_deposit(acct_num, pin, amount)
                    when 2
                        puts"-----------------------------------"
                        puts"\n"
                        puts "Please enter Account number:".blue
                        acct_num = gets.chomp.to_i
                        puts"Please enter pin:".blue
                        pin = gets.chomp.to_i
                        puts "withdrawal Amount :".blue
                        amount =gets.chomp.to_i
                        BankAccount.make_withdrawal(acct_num, pin, amount)
                        
                    when 3
                        
                    when 4
                        puts"-----------------------------------"
                        puts"\n"
                        puts "Please enter Account number:".blue
                        acct_num = gets.chomp.to_i
                        puts"Please enter pin:".blue
                        pin = gets.chomp.to_i
                        BankAccount.get_balance(acct_num , pin)
                    when 5
                        break
                    end 

                end
            when 3
                
            when 4
                 puts "in construction"
            when 5
                break
            end

   end

     
 end


