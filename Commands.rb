class Commands

  # Dictionary of commands information
  # First element is the method call of BitmapEditor
  # Second element is the number of expected arguments
  @@cmd_data = {
    'I' => ["new_image", 2],
    'C' => ["clear_image", 0],
    'S' => ["show_image", 0],
    'L' => ["set_pixel_colour", 3],
    'V' => ["draw_vertical", 4],
    'H' => ["draw_horizontal", 4],
    'X' => ["exit_console", 0],
    '?' => ["show_help", 0],
  }

  @@cmd_data.default = ["no_command", 0]

  def initialize(command, cls)
    @command = command
    com_info = @@cmd_data[@command]
    func_name = com_info[0]
    @num_args = com_info[1]
    @method_call = cls.method(func_name)
  end

  def run(args)
    list_args = inputs(args)
    if @num_args > 0 && list_args.length != @num_args
      return "You should only enter " + @num_args.to_s +
        " value(s) after the '" + @command + "'"
    end
    if @num_args > 0
      @method_call.call(list_args)
    else
      @method_call.call()
    end
  end

  # Converts a white-spaced string into an array of arguments
  # with the first element removed
  # @param x - The string to analyse
  # @return string[]
  def inputs(x)

    # Remove any double whitespaces or leading/trailing spaces
    clean = x.gsub(/\s+/m, ' ').strip

    # Break up the string into an array
    parts = clean.split(" ")

    # We no longer need the first argument
    parts.shift
    return parts

  end

end