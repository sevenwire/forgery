class Forgery

  class FileReader

    def initialize(folder)
      @folder = folder
    end

    # Reads file from a folder and returns array of content lines.
    # Strips leading and trailing whitespace, including newlines.
    def read_file(file)
      lines = []
      IO.foreach(find(file)) do |line|
        lines << line.strip unless line.strip == ''
      end
      lines
    end

    private

    # Search a file in all load_paths, starting from last to first, so
    # last takes precedence over first.
    def find(name)
      Forgery.load_paths.reverse.each do |path|
        file = "#{path}/#{@folder}/#{name}"
        return file if File.exists?(file)
      end
      raise ArgumentError.new("File '#{name}' wasn't found in '#{@folder}' folder. Searched paths: \n#{Forgery.load_paths.join('\n')}")
    end
  end
end
