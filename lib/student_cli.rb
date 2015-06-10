require_relative "data_structure.rb"
require_relative "scraper.rb"

def mock_scrape
  ben = Student.new('bob builder','let build','excerpt')
  student2 = Student.new('dora explorer','everyday Im hustling','excerpt')
  avi = Student.new('Avi','Learn. Love. Code','Flatiron School Dean')

  Student.students_hash
end


def run(student_object_hash)
  # TEST CODE
  puts student_object_hash['bob builder'].name
  puts student_object_hash['dora explorer'].tagline
  puts student_object_hash['Avi'].tagline
  
  # Actual CLI

  puts "Welcome to the Hashrockets Student Page!"
  command = nil
  help
  while command != 'exit'
    command = gets.downcase.strip
    case command
    when 'list'
      student_object_hash.each {|student,info| puts student}
    when 'search'
      puts 'enter student'
      command = gets.strip
      puts student_object_hash[command].tagline
      puts student_object_hash[command].excerpt
    end
  end
end

def help
  puts "This program accepts the following commands:"
  puts "- help : displays this help message"
  puts "- list : displays a list all students"
  puts "- search : find a particular student by full name"
  puts "- exit : exits this program"
end



run(mock_scrape)