class Flight

    attr_reader :passengers
    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def full?
        @capacity == @passengers.length
    end

    def board_passenger(passenger)
        @passengers.push(passenger) if passenger.has_flight?(@flight_number) && !self.full?
    end

    def list_passengers
        @passengers.map {|ele| ele.name}
    end

    def [](index)
        @passengers[index]
    end

    def <<(passenger)
        self.board_passenger(passenger)
    end
    
end