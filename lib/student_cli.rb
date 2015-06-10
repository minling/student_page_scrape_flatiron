require_relative "data_structure.rb"
require_relative "scraper.rb"
require 'pry'

def run(student_object_hash)

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
      binding.pry
      puts student_object_hash[command].tagline
      puts student_object_hash[command].excerpt
      puts student_object_hash[command].picture
      puts student_object_hash[command].profile_link
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


run(result_of_scraper)