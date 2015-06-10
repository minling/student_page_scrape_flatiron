require_relative "../lib/data_structure.rb"
require_relative "../lib/scraper.rb"
require 'pry'


def welcome
  puts "Welcome to the Hashrockets Student Page!"
end

def help
  puts "This program accepts the following commands:"
  puts "- help : displays this help message"
  puts "- list : displays a list all students"
  puts "- search : find a particular student by full name"
  puts "- exit : exits this program"
  puts "******************"
  puts "What would you like to do?"
end

def list(student_object_hash)
  student_object_hash.each {|student,info| puts student}
end

def search(student_object_hash)
  puts 'Enter student name'
  name = gets.strip.split(" ").collect {|name| name.capitalize}.join(" ")
  get_student_info(student_object_hash, name)
end

def get_student_info(student_object_hash, name)

  if student_object_hash.has_key?(name)
    puts "******************"
    puts "Name: #{name}"  
    puts "Tagline: #{student_object_hash[name].tagline}"
    puts "Excerpt: #{student_object_hash[name].excerpt}"
    puts "Profile Link: #{student_object_hash[name].profile_link}"
    puts "******************"
    puts "Would you like to see #{name}'s photo?"
    answer = gets.strip.downcase
    if answer == "yes"
      open_picture(student_object_hash, name)
    elsif answer == "no"
    
    else
    invalid_input
    end

    puts "Would you like to view #{name}'s profile?"
    answer = gets.strip.downcase
    if answer == "yes"
      get_profile_info(student_object_hash, name)
    elsif answer == "no"
      
    else
      invalid_input
    end
  end
end

def get_profile_info(student_object_hash, name)
  # result_of_profile_scraper
  student = profile_scraper(student_object_hash[name].profile_link)
  puts "******************"
  puts "Biography: #{student.biography}"
  puts "Education: #{student.education}"
  puts "Work: #{student.work}"
  display_social_links(student)
  puts "******************"
  puts "Would you like to view #{name}'s Github page?"
  answer = gets.strip
  if answer == "yes"
    open_github(student, name)
  elsif answer == "no"
    
  else
    invalid_input
  end
end

def display_social_links(student)
student.social.each {|domain, link| puts "#{domain} Link: #{link}" }
end

def open_picture(student_object_hash, name)
  system("open http://web0615.students.flatironschool.com/#{student_object_hash[name].picture}")
end


def open_github(student, name)
  system("open #{student.social[2]}")
end


def invalid_input
  puts "Please enter a valid command"
end

def exit
  puts "Goodbye"
end


def run(student_object_hash)
  welcome
  command = nil
  while command != 'exit'
    help
    command = gets.downcase.strip
    if command == "list"
      list(student_object_hash)
    elsif command == 'search'
      search(student_object_hash)
    elsif command == "help"
    elsif command == "exit"
      break
    else 
      invalid_input
    end
  end
  exit 
end


run(result_of_scraper)