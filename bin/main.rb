require_relative '../lib/university_programs.rb'
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

  next unless (i % 5).zero?

  p 'Type E to exit the program. Type any other key to view the next 5 items.'

  system 'stty cbreak'
  q = $stdin.sysread 1
  break if q == 'e'

  system 'stty cooked'
end
