@months = %w(January February March April May June July August September October November December)

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
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
    puts "Country of birth: "
    cob = gets.chomp
    puts "Hobbies (for multiple, enter each separated by a comma): "
    hobbies = gets.chomp.split(",")
    students << {name: name, cohort: cohort.to_sym, country_of_birth: cob, hobbies: hobbies}
    puts "Now we have #{students.count} students"
    puts "Please enter another name"
    name = gets.chomp
  end
  p students
end
  
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students_by_cohort = {}
  @months.each do |month|
    students_by_cohort[month.downcase.to_sym] = []
  end

  students.each do |student|
    students_by_cohort[student[:cohort]].push(student[:name])
  end
  students_by_cohort.each do |month, cohort|
    puts "#{month.to_s.capitalize} cohort" if !cohort.empty?
    cohort.each_with_index do |student_name, index|
      students.each do |student|
        puts "#{index + 1}. Name: #{student[:name]} | Birth country: #{student[:country_of_birth]} | 
        Hobbies: #{student[:hobbies].join(",")}" if student[:name] == student_name
      end
    end
  end
end
  
def print_footer(students)
  puts "Overall, we have #{students.count} great " + (students.count == 1 ? "student" : "students")
end

def print_everything(students)
  print_header
  print(students)
  print_footer(students)
end

def filter_by_letter(students)
  puts "Filter the students whose name begin with which letter?"
  letter = gets.chomp.to_s.downcase
  filtered = students.select{|student| student[:name][0].downcase == letter}
  puts "Filtered #{filtered.count} out of #{students.count} students"
  print_everything(filtered)
end

def filter_by_length(students)
  filtered = students.select{|student| student[:name].length < 12}
  puts "Filtered #{filtered.count} out of #{students.count} students"
  print_everything(filtered)
end

students = input_students
if students.empty?
  puts "No students have been entered. Please run the program again and input some names."
else
  puts "Please select one of the following numbers to pick the relevant option:"
  puts "1. Print all names unsorted"
  puts "2. Print only those names beginning with a specific letter"
  puts "3. Print only those whose names are less than 12 characters long"
  input = gets.chomp
  if input == "1"
    print_everything(students)
  elsif input == "2"
    filter_by_letter(students)
  elsif input == "3"
    filter_by_length(students)
  end
end

