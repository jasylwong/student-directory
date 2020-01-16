def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end
  
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(40, "-")
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
  puts "No students have been entered."
else
  puts "Filter by first letter of name or length of name? Type the relevant number: "
  puts "1. By letter"
  puts "2. By length (11 character max)"
  puts "3. No filter"
  input = gets.chomp.downcase
  if input == "1"
    filter_by_letter(students)
  elsif input = "2"
    filter_by_length(students)
  else
    print_everything(students)
  end
end

