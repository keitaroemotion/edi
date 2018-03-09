class Util
  class << self
    def show_files
      Dir["./**/*"].select { |d| File.file?(d) }
    end

    def git?(dir: "")
      File.directory?("#{dir}.git")
    end

    def show_git_diffs(base_branch: "develop")
      `git diff #{base_branch} --name-only`.split("\n") 
    end
  end
end  
