
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

splsh = ConsoleSplash.new(20,60)
splsh.write_center(-3, "Apasa <enter> pentru a continua")
splsh.write_horizontal_pattern("*",{:fg=>:white, :bg=>:green})
splsh.write_vertical_pattern("*",{:fg=>:white, :bg=>:red})
'clear'
splsh.write_header("Flood it", "Anghel Daniel", "1.0.0")
splsh.splash
gets()