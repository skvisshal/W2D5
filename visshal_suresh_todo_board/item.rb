class Item

    def self.valid_date?(dateStr)
        array = dateStr.split("-")
        array[0].to_i > 0 && (array[1].to_i > 0 && array[1].to_i < 13) && (array[2].to_i > 0 && array[2].to_i < 32)
    end

    attr_accessor :title, :description
    attr_reader :deadline, :done
    def initialize(title, deadline, description)
        @title = title
        if Item.valid_date?(deadline)
            @deadline = deadline
        else
            raise "invalid date"
        end
        @description = description
        @done = false
    end

    def deadline=(str)
        if Item.valid_date?(str)
            @deadline = str
        else
            raise "deadline is not valid"
        end
    end

    def toggle
        @done = !@done
    end
end


