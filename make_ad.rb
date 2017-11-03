lines = []
File.open("reviews.txt") do |review_file| # innerhalb eines blocks wird die Datei automatisch wieder geschlossen
    lines = review_File.readlines
end



relevant_lines = lines.find_all {|line| line.include?("Truncated")}  #finde alle wahren Elemente und erstelle einen neuen Array aus ihnen und speichere diesen Array in relevant_lines

reviews = relevant_lines.reject { |line| line.include?("--") }

def find_adjective(string)
    words = string.split(" ")
    index = words.find_index("is")
    words[index+1]
end

adjectives= reviews.map do |review| 
    adjective = find_adjective(review)
    "'#{adjective.capitalize}"
end


puts "The critics agree, Truncated is:"
puts adjectives
