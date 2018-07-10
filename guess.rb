def guess_number (guess)
	number = 25
	if guess > number
		puts "Too high, guess again!"
	elsif guess < number
		puts "Too low, guess again!"
	elsif guess == number
		puts "Good job! The number was #{number}"
end