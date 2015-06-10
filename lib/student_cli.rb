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
      name = gets.strip.split(" ").collect {|name| name.capitalize}.join(" ")

      if student_object_hash.has_key?(name)

      puts name  
      puts "Tagline: #{student_object_hash[name].tagline}"
      puts "Excerpt: #{student_object_hash[name].excerpt}"
      puts "Profile Link: #{student_object_hash[name].profile_link}"
      puts "Would you like to see #{name}'s photo?"
      answer = gets.strip.downcase
      if answer == "yes"
        system("open http://web0615.students.flatironschool.com/#{student_object_hash[name].picture}")
      end

      puts "Would you like to visit #{name}'s profile page?"
      answer = gets.strip.downcase
      end


      if answer == "yes"
        # result_of_profile_scraper
        student = profile_scraper(student_object_hash[name].profile_link)
        puts "Biography: #{student.biography}"
        puts "Education: #{student.education}"
        puts "Work: #{student.work}"
        puts "Github Link: #{student.github}"
        puts "Would you like to view #{name}'s Github page?"
        answer = gets.strip
        if answer == "yes"
          system("open #{student.github}")
        elsif answer == "no"
          break
        else
          invalid_input
        end
      elsif answer == "no"
        break
      else
        invalid_input
      end
    else
      invalid_input
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

def invalid_input
  puts "Please enter a valid command"
end


run(result_of_scraper)