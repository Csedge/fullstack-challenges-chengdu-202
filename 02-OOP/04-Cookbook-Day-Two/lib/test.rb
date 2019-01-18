require 'open-uri'
require 'nokogiri'
require_relative 'recipe'

openurl = "http://www.letscookfrench.com/recipes/find-recipe.aspx?aqt=${keyword}"

  # file = '../fraise.html'  # or 'strawberry.html'
  doc = Nokogiri::HTML(open(openurl), nil, 'utf-8')

# Scrape the title
  doc_object = doc.css("div.m_titre_resultat").first(5)
  arr_atr1 = []
  # doc_object.each { |x| arr_atr1 << x.text}

  doc_object.each { |x| arr_atr1 << x.text}
  arr_atr1.collect(&:strip)


# Scrape the content
arr_content = []
doc_object = doc.css("div.m_texte_resultat").first(5)


doc_object.each { |x| arr_con << x.text}
arr_content.collect(&:strip)

