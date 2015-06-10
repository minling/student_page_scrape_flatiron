require 'open-uri'
require 'nokogiri'
require 'pry'

html = open("http://web0615.students.flatironschool.com/").read

doc = Nokogiri::HTML(html)

taglines = doc.search(".home-blog-post-meta").collect { |student| student.text }

names = doc.search(".big-comment a").collect { |student| student.children.text } 

links = doc.search(".big-comment a").collect { |student| student.attribute("href").text }

images = doc.search(".blog-thumb img").collect { |student| student.attribute("src").text }

excerpts = doc.search(".excerpt p").collect { |student| student.text }
