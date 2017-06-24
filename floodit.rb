
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
end

# TODO: Implement everything else as described in the
#       assignment brief.
$scorr=File.read("savegame.txt").to_i
$boardHeight=9
$boardWidth=14
def displayScore
	if($scorr==0)
		puts "No games Played yet."
	else
		puts "Best Game: #{$scorr} turns"
	end
end
def mainMenu
	system ("cls")
	puts "Main menu:"
	puts "s = Start game"
	puts "c = Change size"
	puts "q = Quit"
	displayScore()
	
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


splashScreen()

mainMenu()