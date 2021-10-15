require "./item.rb"
require "./list.rb"
class TodoBoard

    def initialize(label)
        @lists = {}

    end

    def get_command
        print "\nEnter a command: "
        cmd, *args = gets.chomp.split(' ')
        
        case cmd
        when 'mklist'
            @lists[*args] = List.new(*args)
        when 'ls'
            @lists.each {|k,v| puts v.label}
        when 'showall'
            @lists.each {|k,v| puts v.print}
        when 'mktodo'
            @lists[args[0]].add_item(*(args.drop(1)))
        when 'up'
            @lists[args[0]].up(*(args.drop(1)).map{|e| e.to_i})
        when 'down'
            @lists[args[0]].down(*(args.drop(1)).map{|e| e.to_i})
        when 'swap'
            @lists[args[0]].swap(*(args.drop(1)).map{|e| e.to_i})
        when 'sort'
            @lists[args[0]].sort_by_date!
        when 'priority'
            @lists[args[0]].print_priority
        when 'print'
            if args.drop(1).empty?
                @lists[args[0]].print
            else
                @lists[args[0]].print_full_item(*(args.drop(1)).map{|e| e.to_i})
            end
        when 'toggle'
            @lists[args[0]].toggle_item(*(args.drop(1)).map{|e| e.to_i})
        when 'rm'
            @lists[args[0]].remove_item(args.drop(1).map{|e| e.to_i})
        when 'purge'
            @lists[args[0]].purge
        when 'quit'
            return false
        else
            print "Sorry, that command is not recognized."
        end

        true
    end

    def run
        while self.get_command
        end
    end

end