require 'nokogiri'
require 'httparty'
require 'byebug'

class UniversityPrograms
  def initialize(key)
    @url = "https://studyindenmark.dk/portal/?SearchableText=#{key}&submit=Filter"
  end

  def parsing
    unparsed_page = HTTParty.get(@url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    unis = parsed_page.css('tbody').css('tr')
    hash = create_hash(unis)
  end

  private

  def create_hash(obj)
    obj.map do |unis|
      {
        title: unis.css('td')[1].text.gsub(/\n/, '').strip,
        subject: unis.css('td')[2].text.gsub(/\n/, '').strip,
        degree: unis.css('td')[3].text.gsub(/\n/, '').strip,
        institution: unis.css('td')[4].text.gsub(/\n/, '').strip,
        ects: unis.css('td')[5].text
      }
    end
  end
end
