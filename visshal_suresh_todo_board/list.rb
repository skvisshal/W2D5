require "./item.rb"
class List

    attr_accessor :label
    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description = nil)
        begin
            item = Item.new(title, deadline, description)
            @items.push(item)
            return true
        rescue => exception
            return false
        end
    end

    def size
        @items.length
    end

    def valid_index?(index)
        index >=0 && index < @items.length
    end

    def swap(index_1, index_2)
        if self.valid_index?(index_1) && self.valid_index?(index_2)
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            return true
        else
            return false
        end
    end

    def [](index)
        return nil if !self.valid_index?(index)
        @items[index]
    end

    def priority
        @items[0]
    end

    def print
        puts "----------------------------------------------------------"
        puts "#{@label.upcase.ljust(20).rjust(40)}"
        puts "----------------------------------------------------------"
        puts "Index | Item                 | Deadline        | Done?"
        puts "----------------------------------------------------------"
        @items.each.with_index do |item, i|
            puts "#{i.to_s.ljust(5)} | #{item.title.ljust(20)} | #{item.deadline.ljust(15)} | #{item.done}"
        end
        puts "----------------------------------------------------------"
    end

    def print_full_item(index)
        return if !self.valid_index?(index)
        item = @items[index]
        puts "----------------------------------------------------------"
        puts "#{index.to_s.ljust(5)} | #{item.title.ljust(20)} | #{item.deadline.ljust(15)} | #{item.done}"
        puts item.description
        puts "----------------------------------------------------------"
    end

    def print_priority
        self.print_full_item(0)
    end

    def up(index, amount = 1)
        return false if !self.valid_index?(index)
        i = index
        count = 0
        while count < amount
            self.swap(i, i - 1)
            i -= 1
            count += 1
        end
    end

    def down(index, amount = 1)
        return false if !self.valid_index?(index)
        i = index
        count = 0
        while count < amount
            self.swap(i, i + 1)
            i += 1
            count += 1
        end
    end

    def sort_by_date!
        @items.sort_by! {|item| item.deadline}
    end

    def toggle_item(index)
        return false if !self.valid_index?(index)
        @items[index].toggle
    end

    def remove_item(index)
        return false if !self.valid_index?(index)
        @items.delete_at(index)
    end

    def purge
        @items.select! {|item| !item.done}
    end
end