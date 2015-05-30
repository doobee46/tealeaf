require "yaml"
require 'command_line_reporter'
require 'colorize'
require './ui'
require './person'
require './transaction'

class BankAccount < Person
    include CommandLineReporter
    
    attr_accessor :balance, :pin
    @@account_list = []
    @@count = 0
    
    def initialize(balance)
        super
        @info[:transaction]={}
        @info[:transaction][:deposit]=[]
        @info[:transaction][:withdrawal]=[]
        @account_number = @@count += 1
        @balance=0
        @pin=0
        @@account_list << @account
        open()
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
            puts "#{account.full_name} | #{account[:account_number]} | $#{account[:balance]}"
            puts"---------------------------------"
        end
    end
    
end 