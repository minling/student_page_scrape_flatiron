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
