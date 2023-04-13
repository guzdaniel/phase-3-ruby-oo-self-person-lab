require 'pry'
class Person

    attr_reader :name, :happiness, :hygiene
    attr_accessor :bank_account



    def initialize(name, bank_account=25, happiness=8, hygiene=8)
        @name = name
        @bank_account = bank_account
        @happiness = happiness
        @hygiene = hygiene 

    end

    def happiness=(value)
        if value > 10
            @happiness = 10
        elsif value < 0
            @happiness = 0
        else
            @happiness = value
        end 

        # @happiness = value.clamp(0, 10)
    end

    def hygiene=(value)
        @hygiene = value.clamp(0, 10)
    end

    def clean?
        self.hygiene > 7
    end

    def happy?
        self.happiness > 7
    end

    def get_paid(salary)
        self.bank_account += salary
        "all about the benjamins"
    end

    def take_bath
        self.hygiene += 4
        "♪ Rub-a-dub just relaxing in the tub ♫"
    end


    def work_out
        self.happiness += 2
        self.hygiene -= 3
        "♪ another one bites the dust ♫"
    end

    def call_friend(friend)
        friend.happiness += 3
        self.happiness += 3
        "Hi #{friend.name}! It's #{self.name}. How are you?"
    end

    def start_conversation(friend,topic)
        case topic
        when "politics"
            friend.happiness -= 2
            self.happiness -= 2
            "blah blah partisan blah lobbyist"
        when "weather"
            friend.happiness += 1
            self.happiness += 1
            "blah blah sun blah rain"
        else  
            "blah blah blah blah blah"
        end
    end
end

p = Person.new("Danny")
# puts p.happiness
# puts p.hygiene

# puts p.work_out
# puts p.happiness
# puts p.hygiene
o = Person.new("Mario")
puts p.call_friend(o)
puts p.start_conversation(o, "weather")
puts p.start_conversation(o, "politics")
puts p.start_conversation(o, "religion")
