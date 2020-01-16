require 'csv'

@students = []

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save students"
    puts "4. Load the list from students.csv"
    puts "9. Exit"
end

def add_student(student_name, student_cohort)
    @students << {name: student_name, cohort: student_cohort.to_sym}
end

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    name = STDIN.gets.chomp
    new_num = 0
    while !name.empty? do
        add_student(name, "november")
        new_num += 1
        puts "Now we have #{@students.count} students"
        name = STDIN.gets.chomp
    end
    puts "#{new_num} new students have been inputted."
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
    CSV.open(filename, "w") do |csv|
        @students.each do |student|
            student_input = [student[:name], student[:cohort]]
            csv << student_input
        end
    end
    puts "Your student directory list has been saved in #{filename}."
end

def try_load_students
    filename = ( ARGV.first.nil? ? "students.csv" : ARGV.first )
    return if filename.nil?
    if File.exists?(filename)
        load_students(filename)
    else
        puts "Sorry, #{filename} does not exist"
        exit
    end
end 

def load_students(filename = "students.csv")
    CSV.open(filename, "r") do |csv|
        csv.readlines.each do |line|
            name, cohort = line
            add_student(name, cohort)
        end
    end
    puts "Students have been loaded from #{filename}."
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