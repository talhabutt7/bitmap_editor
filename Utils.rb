class Utils

  # Returns whether or not the given string is a capital letter
  # @static
  # @param col - The string entered as the colour
  # @return boolean
  def self.is_valid_colour(col)
    return /[[:upper:]]/.match(col)
  end
  # Returns whether or not the given string is a numeric
  # @static
  # @param val - The value entered as the number
  # @return boolean
  def self.is_numeric(val)
    return val.to_f.to_s == val.to_s || val.to_i.to_s == val.to_s
  end
  # Checks whether or not the given index is correctly bounded
  # within the constraints
  # @static
  # @param index - The number to check
  # @param min - The minimum value this number can be
  # @param max - The maximum value this number can be
  # @return boolean
  def self.is_bounded(index, min, max)
    if index < min || index > max
      return false
    else
      return true
    end
  end


end