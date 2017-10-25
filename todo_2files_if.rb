#modules

module Menu
    def menu
      " Welcome to the TodoList Program!
      This menu will help you use the Task List System
      1) Add Task
      2) Show Task
      3) Delete Task
      4) Write to file
      5) Read from file
      6) Update Task
      7) Toggle Task Status 
      Q) Quit "
    end

    def show
        menu
    end
end

        
module Promptable
    def prompt(message = "What would you like to do?", symbol = ":> ")
      print message
      print symbol
      gets.chomp
    end
end 
        
#class List

class List
attr_reader :all_tasks


    def initialize(status=false)
        @all_tasks = Array.new
        @status = status
    end

    def add(task)
        task = Task.new(task) unless task.is_a? Task
        @all_tasks << task
    end
    
    def show
        @all_tasks.map.with_index { |task, i| "#{i.next})#{task}" }.join("\n")          
    end

    def delete(task_number)
        all_tasks.delete_at(task_number-1)
    end

    def write_to_file(filename)
        machinified = @all_tasks.map(&:to_machine).join("\n")       
        IO.write(filename, machinified)
    end

    def read_from_file(filename)

                IO.readlines(filename).each do |line|                    #.split Divides str into substrings based on a delimiter, returning an array of these substrings.
                c_status, *description = line.split(':') # here the (":") splits the string intop an array like [[], thing, to, do]. status, *description = usw assigns [] to status and "task" to an array of strings 
                c_status = c_status.downcase.include?('x')                  # wenn  string include? x dann setze den status auf true andernfalls ist er false
                add(Task.new(description.join.strip, c_status))    #alte .read methode:  IO.readlines(filename).each do |line| add(Task.new(line.chomp))
                end
        
     end

    def update (task_number, task)
    @all_tasks[task_number-1] = task
    end
    
    def toggle(task_number)
    @all_tasks[task_number-1].toggle_status
    end
end

#class task

class Task
    attr_reader :description
    attr_accessor :status

    def initialize(description, status=false)
    @description = description
    @status = status
    end
    
    def to_s
      "#{represent_status} #{description}"
    end
    
    def completed?
        @status
    end
    
    def to_machine
        "#{represent_status}:#{description}"
    end

    def toggle_status
        @status = !completed?
    end
    
    private
    
    def represent_status
       completed? ? '[X]' : '[ ]'
    end
    
    
end

#programm runner

if __FILE__ == $PROGRAM_NAME
    include Menu
    include Promptable
    my_list = List.new
    puts "Please choose from the following list"
        until ["q"].include?(user_input = prompt(show).downcase)
            case user_input
            when "1"
            my_list.add(prompt("What is the task you would like to accomplish?"))
            when "2"
            puts "Your task list:"
            puts my_list.show
            when "3"
            my_list.delete(prompt("Enter Task Number to delete? ").to_i)
            when "4"
            my_list.write_to_file(prompt("Filename?"))
            when "5"
                begin
                my_list.read_from_file(prompt("Filename?"))
                rescue Errno::ENOENT
                puts 'File name not found, please verify your file name and path.'
            end
            
            when "6"
            my_list.update(prompt("Enter Task Number to update").to_i, Task.new(prompt('Task Description?')))
            
            when "7"
            my_list.toggle(prompt("Enter Task Number to toggle").to_i)
            
            else
            puts "Sorry, I did not understand"
            end      
        prompt("Press enter to continue", "")
        end
      puts "Outro - Thanks for using the menu system"
end 
