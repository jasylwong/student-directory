def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # create an empty array
    students = []
    # get the name first
    name = gets.chomp
    # while the name is not empty, repeat this code
    while !name.empty? do
        # add the student hash to the array
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        # get another name from the user
        name = gets.chomp
    end
    # return the array of students
    students
end

def print_header
    puts "The students of Villains Academy"
    puts "--------------"
end

FIRST_LETTER = "A"

def print(students)
    students.each do |student|
        puts "#{student[:name]} (#{student[:cohort]} cohort)" if student[:name][0] == FIRST_LETTER
    end
end

def print_footer(names)
    first_letter_count = names.count{|name| name[:name][0] == FIRST_LETTER}
    puts "Overall, we have #{names.count} great students, but only #{first_letter_count} where the name begins with #{FIRST_LETTER}."
end

students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)
