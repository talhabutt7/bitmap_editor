class BitmapEditor

  # Constants
  BLANK_PIXEL = 'O'
  MAX_SIZE = 250

  # Initialise the empty canvas
  @io = nil
  @canvas = nil

  def initialize(io)
    @io = io
  end

  # Make a call to the private functions below based on user input
  # and returns the result to print to the screen
  # @public
  # @param input - The unformatted raw input string
  # @return string
  def process(input)
    first_char = input[0, 1].capitalize
    cmd = Commands.new(first_char, self)
    cmd.run(input)
  end

  # A getter method to return the canvas object
  # @public
  # @return canvas
  def get_canvas
    return @canvas
  end

  private

  # Create a new bitmap in the class
  # @private
  # @param args - The array of string arguments
  # @return string
  def new_canvas(args)

    # x and y must be numbers
    if !Utils.is_numeric([args[0], args[1]])
      return "X and Y must both be numbers"
    end

    width = args[0].to_i
    height = args[1].to_i

    if width < 1 || height < 1
      return "The canvas must be at minimum 1x1"
    end

    if width > MAX_SIZE || height > MAX_SIZE
      return "The maximum width and height is " + MAX_SIZE.to_s
    end

    @canvas = Canvas.new(width, height)
    return clear_canvas

  end

  # Replaces all the pixels in the canvas by an O
  # @private
  # @return string
  def clear_canvas
    return canvas_created if canvas_created != ""
    @canvas.fill(BLANK_PIXEL)
    return ""
  end

  # Sets the colour of one pixel
  # @param args - The array containing the X, Y and colour
  # @return string
  def set_pixel_colour(args)

    return canvas_created if canvas_created != ""

    # x and y must be numbers
    if !Utils.is_numeric([args[0], args[1]])
      return "X and Y must both be numbers"
    end

    # Get the integer values of X and Y
    # and subtract 1 so that the first pixel is (1, 1)
    x = args[0].to_i - 1
    y = args[1].to_i - 1

    # Must be a valid colour
    col = args[2]
    if !Utils.is_uppercase_char(col)
      return "Colours must be capital letters"
    end

    # x and y must be valid bounds within the canvas
    if @canvas.fits_width(x) && @canvas.fits_height(y)
      @canvas.set(x, y, col)
    else
      return "You entered a pixel which isn't in the canvas"
    end

    return ""

  end

  # Draws a horizontal line
  # @public
  # @param args - The array containing the X1/X2, Y1/Y2 and colour
  # @return string
  def draw_horizontal(args)
    return draw_line("H", args)
  end

  # Draws a vertical line
  # @public
  # @param args - The array containing the X1/X2, Y1/Y2 and colour
  # @return string
  def draw_vertical(args)
    return draw_line("V", args)
  end

  # When no command or an invalid command has been entered
  # @public
  # @return string
  def no_command
    return "Please type a valid command, type ? for help"
  end

  # Draws either a horizontal or vertical line across the canvas
  # @public
  # @param type - A string either 'H' or 'V'
  # @param args - The array containing the X1/X2, Y1/Y2 and colour
  # @return string
  def draw_line(type, args)

    return canvas_created if canvas_created != ""

    # x and y values must be numbers
    if !Utils.is_numeric([args[0], args[1], args[2]])
      return "X and Y values must be numbers"
    end

    # Must be a valid colour
    col = args[3]
    if !Utils.is_uppercase_char(col)
      return "Colours must be capital letters"
    end

    # Generic variable names as we are covering for both
    # H and V in this function.
    # Again, subtract 1 so that the first pixel is (1, 1)
    num1 = args[0].to_i - 1
    num2 = args[1].to_i - 1
    num3 = args[2].to_i - 1

    if type == "V"
      if !@canvas.fits_width(num1) || !@canvas.fits_height(num2) || !@canvas.fits_height(num3)
        return "You entered a pixel which isn't in the canvas"
      end
    elsif type == "H"
      if !@canvas.fits_width(num1) || !@canvas.fits_width(num2) || !@canvas.fits_height(num3)
        return "You entered a pixel which isn't in the canvas"
      end
    end

    @canvas.line(type, num1, num2, num3, col)
    return ""

  end

  # Prints the canvas to the screen
  # @private
  # @return string
  def show_canvas
    return canvas_created if canvas_created != ""
    return @canvas.show
  end

  # Check that an canvas has been created
  # @private
  # @return string
  def canvas_created
    if @canvas == nil
      return "You haven't created an canvas yet"
    else
      return ""
    end
  end

  # Exits the program
  # @private
  # @return string
  def exit_console
    @io.stop
    return "Thanks for running the program!"
  end

  # Prints help text
  # @private
  # @return string
  def show_help
    return "I M N - Create a new M x N canvas. \n" +
      "C - Sets all pixels to colour '" + BLANK_PIXEL + "'. \n" +
      "L X Y C - Colours the pixel (X,Y) with colour C. \n" +
      "V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive). \n" +
      "H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive). \n" +
      "S - Show the contents of the current canvas \n" +
      "X - Terminate the session"
  end

end