class BitmapEditor

  # Initialise the class as the program hasn't started yet
  @running = false
  @image = nil
  BLANK_PIXEL = 'O'

  # Start the program running
  # @public
  # @return void
  def start

    @running = true
    puts 'Welcome to Bitmap Editor'
    puts 'type ? for help'

    # Keep looping until the user ends the program
    while @running

      print '> '

      # Get the input from the user and switch on the first character
      input = gets.chomp
      first_char = input[0, 1].capitalize
      # Call a utiltity function to break down the white-spaced inputs
      # into an array of strings
      args = Utils.analyse_input(input)
      case first_char
      when '?'
        show_help
      when 'I'
        new_image(args)
      when 'S'
        show_image
      when 'X'
        exit_console
      else
        puts "Unrecognised Command '#{input}"
      end
    end
  end
  private

  # Create a new bitmap in the class
  # @private
  # @params args - The array of string arguments
  # @return void
  def new_image(args)

    # Convert the width and height arguments to integer
    width = args[0].to_i
    height = args[1].to_i

    # Create a new 2-dimensional array
    @image = Array.new(height) { Array.new(width) }
    clear_image

  end

  # Replaces all the pixels in the image by an O
  # @private
  # @return void
  def clear_image
    for y in 0..(@image.length-1)
      for x in 0..(@image[y].length-1)
        @image[y][x] = BLANK_PIXEL
      end
    end
  end

  # Prints the image to the screen
  # @private
  # @return void
  def show_image
    if @image == nil
      puts "You haven't created an image yet"
    else
      for y in 0..(@image.length-1)
        for x in 0..(@image[y].length-1)
          print @image[y][x]
        end
        print "\n"
      end
    end
  end

  # Exits the program
  # @private
  # @return void
  def exit_console
    puts "Thanks for running the program!"
    @running = false
  end
  # Prints help text
  # @private
  # @return void
  def show_help
    puts "I M N - Create a new M x N canvas. \n" +
           "C - Sets all pixels to colour '" + BLANK_PIXEL + "'. \n" +
           "L X Y C - Colours the pixel (X,Y) with colour C. \n" +
           "V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive). \n" +
           "H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive). \n" +
           "S - Show the contents of the current canvas \n" +
           "X - Terminate the session"
  end

end