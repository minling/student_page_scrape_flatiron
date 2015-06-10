require_relative "data_structure.rb"
require_relative "scraper.rb"
require 'pry'

def run(student_object_hash)



  puts "Welcome to the Hashrockets Student Page!"
  command = nil
  while command != 'exit'
    help
    command = gets.downcase.strip
    case command
    when 'list'
      student_object_hash.each {|student,info| puts student}
    when 'search'
      puts 'enter student'
      name = gets.strip
      puts student_object_hash[name].tagline
      puts student_object_hash[name].excerpt
      puts student_object_hash[name].picture
      puts student_object_hash[name].profile_link
      puts "Would you like to visit #{name}'s profile page?"
      answer = gets.strip
      case answer
      when "yes"
        # result_of_profile_scraper
        profile_scraper(student_object_hash[name].profile_link)
        puts StudentProfile.profile_hash[name].biography
        puts StudentProfile.profile_hash[name].education
        puts StudentProfile.profile_hash[name].work
        puts StudentProfile.profile_hash[name].github
        puts "Would you like to view #{name}'s GitHub page?"
        answer = gets.strip
        case answer
        when "yes"
          system("open #{StudentProfile.profile_hash[name].github}")
        end
      end
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