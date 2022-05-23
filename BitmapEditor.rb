class BitmapEditor

  # Constants
  BLANK_PIXEL = 'O'
  MAX_SIZE = 250

  # Initialise the class as the program hasn't started yet
  @running = false
  @image = nil
  @width = 0
  @height = 0

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
      when 'C'
        clear_image
      when 'L'
        set_pixel_colour(args)
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
  # @param args - The array of string arguments
  # @return void
  def new_image(args)

    # Convert the width and height arguments to integer
    @width = args[0].to_i
    @height = args[1].to_i

    if @width > MAX_SIZE || @height > MAX_SIZE
      puts "The maximum width and height is " + MAX_SIZE.to_s
      return
    end

    # Create a new 2-dimensional array
    # and clear the image
    @image = Array.new(@height) { Array.new(@width) }
    clear_image

  end
  # Replaces all the pixels in the image by an O
  # @private
  # @return void
  def clear_image
    for y in 0..(@height-1)
      for x in 0..(@width-1)
        @image[y][x] = BLANK_PIXEL
      end
    end
  end

  # Sets the colour of one pixel
  # @param args - The array containing the X, Y and colour
  # @return void
  def set_pixel_colour(args)

    # x and y must be numbers
    if !Utils.is_numeric(args[0]) || !Utils.is_numeric(args[1])
      puts "X and Y must both be numbers"
      return
    end

    # Get the integer values of X and Y
    # and subtract 1 so that the first pixel is (1, 1)
    x = args[0].to_i - 1
    y = args[1].to_i - 1

    # Must be a valid colour
    col = args[2]

    if !Utils.is_valid_colour(col)
      puts "Colours must be capital letters"
      return
    end

    # x and y must be valid bounds within the image
    if x >= @width || x < 0 || y >= @height || y < 0
      puts "This pixel doesn't exist"
      return
    end

    @image[y][x] = col

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