class BitmapEditor
  # Constants
  BLANK_PIXEL = 'O'
  MAX_SIZE = 250
  # Initialise the class as the program hasn't started yet
  @running = false
  @image = nil

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
      # Get the input from the user
      input = gets.chomp
      output = call(input)
      if (output != "")
        puts output
      end
    end
  end
  # Make a call to the private functions below based on user input
  # and returns the result to print to the screen
  # @public
  # @param input - The unformatted raw input string
  # @return string
  def call(input)
    first_char = input[0, 1].capitalize
    cmd = Commands.new(first_char, self)
    cmd.run(input)
  end
  private
  # Create a new bitmap in the class
  # @private
  # @param args - The array of string arguments
  # @return string
  def new_image(args)

    width = args[0].to_i
    height = args[1].to_i

    if width < 1 || height < 1
      return "The image must be at minimum 1x1"
    end

    if width > MAX_SIZE || height > MAX_SIZE
      return "The maximum width and height is " + MAX_SIZE.to_s
    end

    @image = Image.new(width, height)
    return clear_image

  end
  # Replaces all the pixels in the image by an O
  # @private
  # @return string
  def clear_image
    return image_created if image_created != ""
    @image.fill(BLANK_PIXEL)
    return ""
  end

  # Sets the colour of one pixel
  # @param args - The array containing the X, Y and colour
  # @return string
  def set_pixel_colour(args)
    return image_created if image_created != ""
    # x and y must be numbers
    if !Utils.is_numeric(args[0]) ||
      !Utils.is_numeric(args[1])
      return "X and Y must both be numbers"
    end
    # Get the integer values of X and Y
    # and subtract 1 so that the first pixel is (1, 1)
    x = args[0].to_i - 1
    y = args[1].to_i - 1
    # Must be a valid colour
    col = args[2]
    if !Utils.is_valid_colour(col)
      return "Colours must be capital letters"
    end

    # x and y must be valid bounds within the image
    if Utils.is_bounded(x, 0, @image.getWidth - 1) &&
      Utils.is_bounded(y, 0, @image.getHeight - 1)
      @image.set(x, y, col)
    else
      return "You entered a pixel which isn't in the image"
    end
    return ""
  end

  def draw_horizontal
    return draw_line("H", args)
  end

  def draw_vertical(args)
    return draw_line("V", args)
  end


  # Draws either a horizontal or vertical line across the image
  # @param type - A string either 'H' or 'V'
  # @param args - The array containing the X1/X2, Y1/Y2 and colour
  # @return string
  def draw_line(type, args)
    return image_created if image_created != ""
    # x and y values must be numbers
    if !Utils.is_numeric(args[0]) ||
      !Utils.is_numeric(args[1]) ||
      !Utils.is_numeric(args[2])
      return "X and Y values must be numbers"
    end
    # Must be a valid colour
    col = args[3]
    if !Utils.is_valid_colour(col)
      return "Colours must be capital letters"
    end
    # Generic variable names as we are covering for both
    # H and V in this function.
    # Again, subtract 1 so that the first pixel is (1, 1)
    num1 = args[0].to_i - 1
    num2 = args[1].to_i - 1
    num3 = args[2].to_i - 1

    if type == "V"
      if !Utils.is_bounded(num1, 0, @image.getWidth - 1) ||
        !Utils.is_bounded(num2, 0, @image.getHeight - 1) ||
        !Utils.is_bounded(num3, 0, @image.getHeight - 1)
        return "You entered a pixel which isn't in the image"
      end
    elsif type == "H"
      if !Utils.is_bounded(num1, 0, @image.getWidth - 1) ||
        !Utils.is_bounded(num2, 0, @image.getWidth - 1) ||
        !Utils.is_bounded(num3, 0, @image.getHeight - 1)
        return "You entered a pixel which isn't in the image"
      end
    end

    @image.line(type, num1, num2, num3, col)
    return ""

  end
  # Prints the image to the screen
  # @private
  # @return string
  def show_image
    return image_created if image_created != ""
    return @image.show
  end

  # Check that an image has been created
  # @private
  # @return string
  def image_created
    if @image == nil
      return "You haven't created an image yet"
    else
      return ""
    end
  end
  # Exits the program
  # @private
  # @return string
  def exit_console
    @running = false
    return "Thanks for running the program!"
  end
  # Prints help text
  # @private
  # @return string
  def show_help
    return "I M N - Create a new M x N image. \n" +
      "C - Sets all pixels to colour '" + BLANK_PIXEL + "'. \n" +
      "L X Y C - Colours the pixel (X,Y) with colour C. \n" +
      "V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive). \n" +
      "H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive). \n" +
      "S - Show the contents of the current image \n" +
      "X - Terminate the session"
  end
end