#require to init splash screen and colorize for board colors
require 'console_splash'
require 'colorize'

def get_board(width, height)
  # TODO: Implement this method
  #
  # This method should return a two-dimensional array.
  # Each element of the array should be one of the
  # following values (These are "symbols", you can use
  # them like constant values):
  # :red
  # :blue
  # :green
  # :yellow
  # :cyan
  # :magenta
  #
  # It is important that this method is used because
  # this will be used for checking the functionality
  # of your implementation.
  colorss=[:red,:blue,:green,:yellow,:cyan,:magenta]
  data = Array.new(width) { Array.new(height)}
  (0...width).each do |i|
  	(0...height).each do |j|
  		data[i][j]=colorss.sample
  	end
  end
  return data
end

# TODO: Implement everything else as described in the
#       assignment brief.
$scorr=File.read("savegame.txt").to_i
#read the best score from savegame.txt as an integer.
$boardHeight=9
$boardWidth=14
#height and width as global variables
def displayScore
	#use this to show the best score in main menu. 
	if($scorr==0)
		puts "No games Played yet."
	else
		puts "Best Game: #{$scorr} turns"
	end
end
def playerChoice(litera)
	#choice from main menu
	ok=0
	if (litera=="s")
		ok=1
		system ("cls")
		startGame(get_board($boardWidth,$boardHeight),0.to_i)
	end
	if(litera=="c")
		ok=2
		changeSize()
	end
	if(litera=="q")
		ok=3
		exit 1
	end
	if(ok==0)
		puts "you didnt enter a valid choice"
		#just to be sure
		gets()
		mainMenu()
	end
end
#if the player wants to change the size, make sure that it's fine and 
#he doesn't enter something else(words for example)
#or too big or too small size for board
def itsOKquestion(test)
if(test.to_i<4||test.to_i>30)
	return false
end
return true
end
def changeSize
	#here we change and we check if it's fine with what whats above
print "Width (currently #{$boardWidth})? "
test=gets.chomp
if(itsOKquestion(test))
	$boardWidth=test
end
puts ""
print "height (currently #{$boardHeight})? "
test=gets.chomp
if(itsOKquestion(test))
	$boardHeight=test
end
puts ""
gets()
mainMenu()
end
#main menu, it's shown after the splash screen
def mainMenu
	system ("cls")
	puts "Main menu:"
	puts "s = Start game"
	puts "c = Change size"
	puts "q = Quit"
	displayScore()
	puts "Please Enter your choice: "
	amAles=gets.chomp
	playerChoice(amAles)
end

def splashScreen
system ("cls")
splsh = ConsoleSplash.new(20,60)
splsh.write_center(-3, "Apasa <enter> pentru a continua")
splsh.write_horizontal_pattern("*",{:fg=>:white, :bg=>:green})
splsh.write_vertical_pattern("*",{:fg=>:white, :bg=>:red})
'clear'
splsh.write_header("Flood it", "Anghel Daniel", "1.0.0")
splsh.splash
gets()
end

def percentageDone(board, color)

end

def startGame(board,turns)
	system ("cls")
	(0...$boardWidth).each do |i|
		puts " "
  	(0...$boardHeight).each do |j|
  		print "██".colorize(board[i][j])
  	end
  end
  puts ""
  #todos
  puts "Number of turns: #{turns}"
  puts "Current completion: X%"
  puts "Choose a colour:" 
  print "███".colorize(:red) 
  print "███".colorize(:blue) 
  print "███".colorize(:green) 
  print "███".colorize(:yellow) 
  print "███".colorize(:cyan) 
  print "███".colorize(:magenta) 
  puts ""
  puts " r  b  g  y  c  m"
  #rgbymc q
  gets()
  startGame(board,turns)
end

#start from splashscreen, then the main menu
String.disable_colorization = false
splashScreen()

mainMenu()
