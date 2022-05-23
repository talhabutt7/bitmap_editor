class Canvas

  # Properties of an canvas
  @data = nil
  @width = 0
  @height = 0

  # Creates a new canvas
  # @public
  # @return void
  def initialize(width, height)
    @width = width
    @height = height

    # Create a new 2-dimensional array
    @data = Array.new(@height) { Array.new(@width) }
  end

  # Gets the width of an canvas
  # @public
  # @return integer
  def getWidth
    return @width
  end

  # Gets the height of an canvas
  # @public
  # @return integer
  def getHeight
    return @height
  end

  # Fill all the pixels in an with a given letter
  # @public
  # @param letter - The letter to replace all cells with
  # @return void
  def fill(letter)
    for y in 0..(@height-1)
      for x in 0..(@width-1)
        @data[y][x] = letter
      end
    end
  end

  # Set a given pixel at (x, y) to the letter
  # @public
  # @param x - The x coordinate (zero-index)
  # @param y - The y coordinate (zero-index)
  # @param value - The value to put in the pixel
  # @return void
  def set(x, y, value)
    @data[y][x] = value
  end

  # Set a given pixel at (x, y) to the letter
  # @public
  # @param type - Either 'V' or 'H'
  # @param [num1, num2, num3] - If type if H, then X1 X2 Y, if V then X Y1 Y2
  # @param col - The value to put in the pixels
  # @return void
  def line(type, num1, num2, num3, col)
    for y in 0..(@height-1)
      for x in 0..(@width-1)
        if type == "V"
          if x == num1 && y >= num2 && y <= num3
            @data[y][x] = col
          end
        elsif type == "H"
          if x >= num1 && x <= num2 && y == num3
            @data[y][x] = col
          end
        end
      end
    end
  end

  # Returns the string representation of the canvas
  # @public
  # @return string
  def show
    output = ""
    for y in 0..(@data.length-1)
      for x in 0..(@data[y].length-1)
        output += @data[y][x]
      end
      output += "\n"
    end
    return output.strip
  end

  # Checks whether the value fits in canvas width size
  # @public
  # @param val - The number to check
  # @return boolean
  def fits_width(val)
    return is_bounded(val, 0, @width - 1)
  end

  # Checks whether the value fits in canvas height size
  # @public
  # @param val - The number to check
  # @return boolean
  def fits_height(val)
    return is_bounded(val, 0, @height - 1)
  end

  private

  # Checks whether or not the given index is correctly bounded
  # within the constraints
  # @private
  # @param index - The number to check
  # @param min - The minimum value this number can be
  # @param max - The maximum value this number can be
  # @return boolean
  def is_bounded(index, min, max)
    if index < min || index > max
      return false
    else
      return true
    end
  end

end