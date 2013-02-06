require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open("https://twitter.com/WESER_KURIER"))
links = doc.css("p.js-tweet-text a.twitter-timeline-link").map{|link |link['href']}

links.each { |x|
   doc = Nokogiri::HTML(open(x))
   puts "\t" + doc.css("h1.article_headline").text
   puts doc.css("p.article_teaser").text + "\n\n"
   puts doc.css("div.article_body p").text + "\n"
   puts "\n--------------------------------------------------------------------------------\n"
}
