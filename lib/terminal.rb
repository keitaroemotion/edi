require 'io/console'

#
# Thanks for the following Snippet: https://gist.github.com/acook/4190379
#
# author: Kei Sugano<tobasojyo@gmail.com>
#

class Terminal
  ESCAPE_KEY     = "\e"
  UP_ARR_KEY     = "\e[A"
  DOWN_ARR_KEY   = "\e[B"
  RETURN_KEY     = "\r"
  RIGHT_ARR_KEY  = "\e[C"
  LEFT_ARR_KEY   = "\e[D"
  BACK_SPACE_KEY = "\177"
  CONTROL_C      = "\u0003"
 
  class << self
    def get_arrow_input(&block)
      c = read_char

      yield(c) # do something with c

      c == CONTROL_C || get_arrow_input(&block)
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
  end  
end
