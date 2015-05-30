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

