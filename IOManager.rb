class IOManager

  @running = false
  # Start the program running
  # @public
  # @return void
  def start
    editor = BitmapEditor.new(self)
    @running = true
    puts 'Welcome to Bitmap Editor'
    puts 'type ? for help'
    # Keep looping until the user ends the program
    while @running
      print '> '
      # Get the input from the user
      input = gets.chomp
      output = editor.process(input)
      if (output != "")
        puts output
      end
    end

  end

  # Ends the input/output stream
  # @public
  # @return void
  def stop
    @running = false
  end
end