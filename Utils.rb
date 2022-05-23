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

  def self.is_valid_colour(col)
    return /[[:upper:]]/.match(col)
  end

  def self.is_numeric(val)
    return val.to_f.to_s == val.to_s || val.to_i.to_s == val.to_s
  end

end