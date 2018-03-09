class Util
  class << self
    def show_files
      Dir["./**/*"].select { |d| File.file?(d) }
    end
  end
end  
