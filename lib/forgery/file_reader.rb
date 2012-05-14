class Forgery

  class FileReader

    # Reads file from a folder and returns array of content lines.
    # Strips leading and trailing whitespace, including newlines.
    def self.read_file_from_folder(file, folder)
      lines = []
      IO.foreach(find_file(file, folder)) do |line|
        lines << line.strip unless line.strip == ''
      end
      lines
    end

    private

    # Search a file in all load_paths, starting from last to first, so
    # last takes precedence over first.
    def self.find_file(name, folder)
      Forgery.load_paths.reverse.each do |path|
        file = "#{path}/#{folder}/#{name}"
        return file if File.exists?(file)
      end
      raise ArgumentError.new("File '#{name}' wasn't found in '#{folder}' folder. Searched paths: \n#{Forgery.load_paths.join('\n')}")
    end
  end
end
