require 'open-uri'
require 'nokogiri'
require 'pry'

require_relative "data_structure.rb"

def result_of_scraper

  html = open("http://web0615.students.flatironschool.com/").read

  doc = Nokogiri::HTML(html)

  taglines = doc.search(".home-blog-post-meta").collect { |student| student.text }

  names = doc.search(".big-comment a").collect { |student| student.children.text }

  links = doc.search(".big-comment a").collect { |student| student.attribute("href").text }

  pictures = doc.search(".blog-thumb img").collect { |student| student.attribute("src").text }

  excerpts = doc.search(".excerpt").collect { |student| student.text.strip }

  names.each_with_index do |name,index| 
    Student.new(name,taglines[index],excerpts[index],pictures[index],links[index])
  end

  Student.students_hash

end



def profile_scraper(profile_url)

  html = open("http://web0615.students.flatironschool.com/#{profile_url}").read

  profile = Nokogiri::HTML(html)

  name = profile.search("h4.ib_main_header").text

  # twitter
  # linkedin
  # github
  # blog
  social = profile.search("div.social-icons a").collect do |children|
    children.attribute("href").text
  end

  # biography
  # education
  # work
  information = {}
  

  profile.search('div.services').each do |section|
    information[section.search('h3').text.strip] = section.search('p,ul').text.strip

    # puts section.search('a') 

    # if section.search('a') != nil
    #   puts section.search('a').attribute("href").text
    # else
    #   puts 'no links'
    # end 
  end

  binding.pry
  
  StudentProfile.new(name, information['Biography'],information['Education'],information['Work'],social[2]) 

end


# students = result_of_scraper
# puts students["Ben Brattain"].profile_link

# # profile_scraper(students["Ben Brattain"].profile_link)
# profile_scraper(students["Elaina Polson"].profile_link)


