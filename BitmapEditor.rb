class BitmapEditor

  def run
    @running = true
    puts 'type ? for commands information'
    while @running
      print '> '
      input = gets.chomp
      case input
      when '?'
        show_help
      when 'X'
        exit_console
      else
        puts "Unrecognised Command '#{input}', please enter a valid command"
      end
    end
  end

  private
  def exit_console
    puts 'goodbye!'
    @running = false
  end

  def show_help
    puts "? - Help
I M N - Create a new M x N image with all pixels coloured white (O).
C - Clears the canvas, setting all pixels to white (O).
L X Y C - Colours the pixel (X,Y) with colour C.
V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
S - Show the contents of the current canvas
X - Terminate the session"
  end
end