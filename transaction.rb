module Transaction
    #contains all the operation need to manage a bank
    def balance
        # return balance  for each new object
        puts"-----------------------------------"
        puts"      Accounts balance - #{@account_number}"
        puts"-----------------------------------"
        puts "Your actual balance is $#{info[:balance]}"
        puts"-----------------------------------"
    end 
    
    def deposit(amount)
        #add amount to the balance and return the aggregated amount 
        depo_trans = @info[:balance] += amount
        @deposit.push(depo_trans)
    end
    
    def withdrawal(amount)
        depo_withdrawal = @info[:balance] -= amount
        @withdrawal.push(amount)
    end 
    
    def transac_info
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
    
    
    def transfer( account_number,pin, amount)
        origin = @info[:balance]
        lists=BankAccount.account_list
        lists.each do |list|
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
    
end