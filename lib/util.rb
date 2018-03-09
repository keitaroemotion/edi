class Util
  require 'io/console'

  class << self
    def get_user_input(mock_val: nil, downcase: true)
      if mock_val
        return mock_val
      end
      input = $stdin.gets.chomp
      if downcase
        input = input.downcase
      end
      input
    end

    def git?(dir: "")
      File.directory?("#{dir}.git")
    end

    def show_git_diffs(base_branch: "develop")
      `git diff #{base_branch} --name-only`.split("\n") 
    end

    def show_files
      Dir["./**/*"].select { |d| File.file?(d) }
    end

    #
    # XXX
    #

    def get_arrow_input
      show_single_key while(true)
    end

    def read_char
      STDIN.echo = false
      STDIN.raw!
    
      input = STDIN.getc.chr
      if input == "\e" then
        input << STDIN.read_nonblock(3) rescue nil
        input << STDIN.read_nonblock(2) rescue nil
      end
    ensure
      STDIN.echo = true
      STDIN.cooked!
      return input
    end

    def show_single_key
      c = read_char
    
      case c
      when " "
        puts "SPACE"
      when "\t"
        puts "TAB"
      when "\r"
        puts "RETURN"
      when "\n"
        puts "LINE FEED"
      when "\e"
        puts "ESCAPE"
      when "\e[A"
        puts "UP ARROW"
      when "\e[B"
        puts "DOWN ARROW"
      when "\e[C"
        puts "RIGHT ARROW"
      when "\e[D"
        puts "LEFT ARROW"
      when "\177"
        puts "BACKSPACE"
      when "\004"
        puts "DELETE"
      when "\e[3~"
        puts "ALTERNATE DELETE"
      when "\u0003"
        puts "CONTROL-C"
        exit 0
      when /^.$/
        puts "SINGLE CHAR HIT: #{c.inspect}"
      else
        puts "SOMETHING ELSE: #{c.inspect}"
      end
    end
  end
end  
