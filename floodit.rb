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
  (0...height).each do |i|
  	(0...width).each do |j|
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
		startGame(get_board($boardWidth,$boardHeight),"0".to_i)
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

def percentageDone(board)
	counter=0
	(0...$boardHeight).each do |i|
  	(0...$boardWidth).each do |j|
  		if(board[i][j]==board[0][0])
  			counter=counter+1
  		end
  	end
  end
  return (100*counter)/($boardWidth*$boardHeight)
end

def startGame(board,turns)
	system ("cls")
	(0...$boardHeight).each do |i|
		puts " "
  	(0...$boardWidth).each do |j|
  		print "██".colorize(board[i][j])
  	end
  end
  puts ""
  #todos
  puts "Number of turns: #{turns}"
  puts "Current completion: #{percentageDone(board)}%"
  puts "Choose a colour:" 
  print "███".colorize(:red) 
  print "███".colorize(:blue) 
  print "███".colorize(:green) 
  print "███".colorize(:yellow) 
  print "███".colorize(:cyan) 
  print "███".colorize(:magenta) 
  print "   quit".colorize(:red)
  puts ""
  puts " r  b  g  y  c  m     q"
  amAles=gets.chomp
  if(amAles=="q")
  	mainMenu()
  end
  board=changeBoard(board,amAles,"0".to_i,"0".to_i,board[0][0])
  (0...$boardHeight).each do |i|
  	(0...$boardWidth).each do |j|
  		if(board[i][j]==":tobechanged")
  			board[i][j]=ceAmAles(amAles)
  		end
  	end
  end

  turns=turns+1
  startGame(board,turns)
end

def ceAmAles(amAles)
colorss=[:red,:blue,:green,:yellow,:cyan,:magenta]
if(amAles=="r")
	return colorss[0]
end
if(amAles=="b")
	return colorss[1]
end
if(amAles=="g")
	return colorss[2]
end
if(amAles=="y")
	return colorss[3]
end
if(amAles=="c")
	return colorss[4]
end
if(amAles=="m")
	return colorss[5]
end
end

def changeBoard(board,amAles,xa,ya,pozZeroo)

	board[0][0]=":tobechanged"
	pozZero=ceAmAles(amAles)
	if(board[xa+1][ya]==pozZeroo&&xa+1<$boardHeight)
		puts "hereee"
		board[xa+1][ya]=":tobechanged"
		board=changeBoard(board,amAles,xa+1,ya,pozZeroo)
	end
	if(board[xa][ya+1]==pozZeroo&&ya+1<$boardWidth)
		puts "hereee1"
		board[xa][ya+1]=":tobechanged"
		board=changeBoard(board,amAles,xa,ya+1,pozZeroo)
	end
	if(board[xa][ya-1]==pozZeroo&&ya-1>=0)
		puts "hereee2"
		board[xa][ya-1]=":tobechanged"
		board=changeBoard(board,amAles,xa,ya-1,pozZeroo)
	end
	if(board[xa-1][ya]==pozZeroo&&xa-1>=0)
		puts "hereee3"
		board[xa-1][ya]=":tobechanged"
		board=changeBoard(board,amAles,xa-1,ya,pozZeroo)
	end
	return board
end
#start from splashscreen, then the main menu
String.disable_colorization = false
splashScreen()

mainMenu()
