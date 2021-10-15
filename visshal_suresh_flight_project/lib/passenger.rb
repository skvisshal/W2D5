class Passenger

    attr_reader :name
    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def has_flight?(string)
        @flight_numbers.include?(string.upcase)
    end

    def add_flight(string)
        @flight_numbers.push(string.upcase) if !self.has_flight?(string)
    end
end