class Utils

  # Converts a white-spaced string into an array of arguments
  # with the first element removed
  # @static
  # @param input - The string to analyse
  # @return string[]
  def self.analyse_input(input)

    # Remove any double whitespaces or leading/trailing spaces
    clean = input.gsub(/\s+/m, ' ').strip

    # Break up the string into an array
    parts = clean.split(" ")

    # We no longer need the first argument
    parts.shift
    return parts
  end
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

  def self.number_args(cmd, args)

    expected_args = 0

    case cmd
    when 'I'
      expected_args = 2
    when 'L'
      expected_args = 3
    when 'H', 'V'
      expected_args = 4
    end

    # Only worry if expected_args > 0 and it doesn't match
    if expected_args > 0 && args.length != expected_args
      return "You should only enter " + expected_args.to_s +
        " value(s) after the '" + cmd + "'"
    end

    return ""

  end

end