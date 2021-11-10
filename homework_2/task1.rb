animals = {
    "Bear" => "bear sound",
    "Deer" => "deer sound",
    "Wolf" => "wolf sound",
    "Tiger" => "tiger sound",
    "Puma" => "puma sound"
}

puts "Enter the name of the animal:"
animal = gets.strip.capitalize

if animals.has_key?(animal)
    puts "#{animals.key(animals[animal])} speak - #{animals[animal]}"
else
    puts "There is no such animal in the database or you entered an incorrect animal name"
end

