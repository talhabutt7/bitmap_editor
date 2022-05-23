class Utils

  # Returns whether or not the given string is a capital letter
  # @static
  # @param col - The string entered as the colour
  # @return boolean
  def self.is_uppercase_char(col)
    return /^[[:upper:]]$/.match(col)
  end
  # Returns whether or not the given string is a numeric
  # @static
  # @param vals - An array of values entered as the number
  # @return boolean
  def self.is_numeric(vals)
    if vals.length > 0
      for i in 0..(vals.length-1)
        if vals[i].to_f.to_s != vals[i].to_s && vals[i].to_i.to_s != vals[i].to_s
          return false
        end
      end
      return true
    else
      return false
    end
  end

end