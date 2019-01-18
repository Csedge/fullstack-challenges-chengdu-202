require 'open-uri'
require 'nokogiri'
require_relative 'recipe'

class Scrapper
  def initialise(keyword)
    @openurl = "http://www.letscookfrench.com/recipes/find-recipe.aspx?aqt=${keyword}"
  end
  # file = '../fraise.html'  # or 'strawberry.html'
  doc = Nokogiri::HTML(File.open(openurl), nil, 'utf-8')
  doc_object = doc.css("div.m_titre_resultat").first(5)
  recipes, arr_name, arr_content = []
  doc_object.each { |x| arr_name << x.text }
  arr_name.collect(&:strip)

  # Scrape the content
  doc_object = doc.css("div.m_texte_resultat").first(5)

  doc_object.each { |x| arr_content << x.text }
  arr_content.collect(&:strip)


end


# "div.m_titre_resultat"
# 'h4.recipe-card__title'

# file = '../strawberry.html'
# doc = Nokogiri::HTML(File.open(file), nil, 'utf-8')
# doc_object = doc.css("div.m_titre_resultat").first(5)
# arr_atr2 = []
# doc_object.each { |x|  arr_atr2 << x.text}

# p arr_atr2


