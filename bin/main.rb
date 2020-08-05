require_relative '../lib/scrapper.rb'
require 'io/console'

puts 'Type the search keyword: '
key = gets.chomp
university_programs = UniversityPrograms.new(key)
university_programs_results = university_programs.parsing
i = 0
university_programs_results.each do |programs|
  i += 1
  p '-----------------------------------------------------------------------------'
  p "   Course: #{programs[:title]}"
  p "   Subject: #{programs[:subject]}"
  p "   Degree: #{programs[:degree]}"
  p "   Institution: #{programs[:institution]}"
  p "   ECTS: #{programs[:ects]}"

  if i % 5.zero?
    p 'Type any key to view the next 5 items'
    $stdin.getch
  end
end
