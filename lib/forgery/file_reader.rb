class Forgery

  class FileReader

    # Returns an array of strings containing each line in the dictionary
    def self.read_dictionary(dictionary)
      read_file(path_to_dictionary(dictionary))
    end

    # Returns an array of strings containing each line in the format
    def self.read_format(format)
      read_file(path_to_format(format))
    end

  protected

    # Reads a file while stripping leading and trailing whitespace, including
    # newlines
    def self.read_file(file)
      lines = []
      IO.foreach(file) do |line|
        lines << line.strip unless line.strip == ''
      end
      lines
    end

    # Returns the path to a format. It will return the external path if the
    # file exists, otherwise it will return the internal path.
    def self.path_to_format(format)
      if external_path_to_format(format) && File.exists?(external_path_to_format(format))
        external_path_to_format(format)
      else
        internal_path_to_format(format)
      end
    end

    # Returns the path to a format outside of forgery
    def self.external_path_to_format(format)
      Forgery.rails_root + '/lib/forgery/formats/' + format.to_s if Forgery.rails?
    end

    # Returns the path to a format inside of forgery
    def self.internal_path_to_format(format)
      File.dirname(__FILE__) + '/formats/' + format.to_s
    end

    # Returns the path to a dictionary. It will return the external path if
    # the file exists, otherwise it will return the internal path.
    def self.path_to_dictionary(dictionary)
      if external_path_to_dictionary(dictionary) && File.exists?(external_path_to_dictionary(dictionary))
        external_path_to_dictionary(dictionary)
      else
        internal_path_to_dictionary(dictionary)
      end
    end

    # Returns the path to a dictionary outside of forgery
    def self.external_path_to_dictionary(dictionary)
      Forgery.rails_root + '/lib/forgery/dictionaries/' + dictionary.to_s if Forgery.rails?
    end

    # Returns the path to a dictionary within forgery
    def self.internal_path_to_dictionary(dictionary)
      File.dirname(__FILE__) + '/dictionaries/' + dictionary.to_s
    end

  end

end
