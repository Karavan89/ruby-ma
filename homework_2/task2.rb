count = 0

while count <= 1 do
    
    puts "Enter number: "
    numbers = gets.strip
    
    count = numbers.split(//).grep('1').count
    
    if count <= 1
        puts "Execution result: #{numbers.to_i * 256}"
    end

 end

 puts "Conditions are not met, I stop the program."