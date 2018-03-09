class Util
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
  end
end  
