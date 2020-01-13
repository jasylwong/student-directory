def input_students
    puts "Please enter the names and cohorts of the students"
    puts "To finish, just hit return twice"
    # create an empty array
    students = []
    # get the name first
    puts "Name: "
    name = gets.chomp
    # while the name is not empty, repeat this code
    while !name.empty? do
        months = %w(January February March April May June July August September October November December) + [""]
        puts "Cohort: "
        cohort = gets.chomp
        while !months.include?(cohort)
            puts "Please enter a valid month"
            puts "Cohort: "
            cohort = gets.chomp
        end
        cohort = cohort.empty? ? :november : cohort.downcase
        # add the student hash to the array
        students << {name: name, cohort: cohort.to_sym}
        puts "Now we have #{students.count} students"
        # get another name from the user
        puts "Name: "
        name = gets.chomp

    end
    # return the array of students
    students
end

def print_header
    puts "The students of Villains Academy"
    puts "--------------"
end

def print(students)
    students.each do |student|
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def print_footer(names)
    puts "Overall, we have #{names.count} great students"
end

students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)
