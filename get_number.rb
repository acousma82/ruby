# Get My Number Game written by Sebastian Peter

puts "Welcome to 'Get my number!'"
print "What's your name? "

name = gets.chomp
puts name.inspect
puts "Welcome, #{name} !"

puts "I've got a random number between 1 and 100"
puts "Can you guess it?"
target = rand(100) + 1
num_guesses = 0
guessed_it = false

until num_guesses == 10 || guessed_it
    puts "You have got #{10 - num_guesses} guesses left."
    print "Make a guess: "
    guess = gets.to_i
    num_guesses += 1

    if guess < target
        puts "Oops Your gues was too low"

    elsif guess > target
        puts "Oops Your guess was too high"
    elsif guess == target
        puts "Good job, #{name}! You guessed my number in #{num_guesses}!"
        guessed_it = true
    end
end

unless guessed_it
    puts "Sorry you didn't get my number. (It was #{target}.)"
end

