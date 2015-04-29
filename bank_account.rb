module Ui
    puts"-----------------------------------"
    puts"   Welcome to Bank of Trust        "
    puts"-----------------------------------"
    puts"--------------Menu-----------------"
    puts"1)Open an Account"
    puts"2)View Balance "
    puts"3)View Transaction"
    puts"4)Change Pin" 
    puts"Choose from the menu above:"
    ans = gets.chomp
end

class Person
    attr_accessor :param
    def initialize(param={})
        @param=param
    end
    
    def change_info(param={})
        self.param=param
    end
        
end

class BankAccount < Person
    include Ui
    attr_accessor :balance
    
    def initialize(balance)
        super
        count = 0
        @account_number = count += 1
        @balance=0
    end
    
    def balance
        @balance
    end
    
    def deposit(amount)
        self.balance += amount
    end
    
    def withdrawal(amount)
        self.balance -= amount
    end
        
end
