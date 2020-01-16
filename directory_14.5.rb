@students = []

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save students"
    puts "4. Load the list from a file"
    puts "9. Exit"
end

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    name = STDIN.gets.chomp
    while !name.empty? do
        @students << {name: name, cohort: :november}
        puts "Now we have #{@students.count} students"
        name = STDIN.gets.chomp
    end
end

def print_header
    puts "The students of Villains Academy"
    puts "--------------"
end

def print_students_list
    @students.each do |student|
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def print_footer
    puts "Overall, we have #{@students.count} great students"
end

def show_students
    print_header
    print_students_list
    print_footer
end

def save_students
    puts "What file would you like to save them in?"
    filename = gets.chomp
    file = File.open(filename, "w")
    file = File.open("students.csv", "w")
    @students.each do |student|
        student_input = [student[:name], student[:cohort]]
        csv_input = student_input.join(",")
        file.puts(csv_input)
    end
    file.close
end

def try_load_students
    filename = ARGV.first
    return if filename.nil?
    if File.exists?(filename)
        load_students(filename)
        puts "Loaded #{@students.count} students from #{filename}"
    else
        puts "Sorry, #{filename} does not exist"
        exit
    end
end 

def load_students(filename = "students.csv")
    file = File.open(filename, "r")
    file.readlines.each do |line|
        name, cohort = line.chomp.split(",")
        @students << {name: name, cohort: cohort.to_sym}
    end
    file.close
end

def process(selection)
    case selection
    when "1"
        input_students
    when "2"
        show_students
    when "3"
        save_students
    when "4"
        puts "What file would you like to load from?"
        filename = gets.chomp
        load_students(filename)
    when "9"
        exit
    else
        puts "I don't know what you meant, try again."
    end
end

def interactive_menu
    loop do
        print_menu
        process(STDIN.gets.chomp)
    end
end

try_load_students
interactive_menu