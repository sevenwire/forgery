class Forgery

  def self.dictionaries
    @@dictionaries ||= Dictionaries.new
  end

  def self.formats
    @@formats ||= Formats.new
  end
  
  def self.load_paths
    @@load_paths ||= [File.dirname(__FILE__)]
  end
  
  def self.load_from!(path)
    self.load_paths << path
    Dir[File.expand_path("#{path}/**/*.rb")].uniq.each { |file| require file }
  end
  
  def self.rails_root
    if defined?(RAILS_ROOT)
      RAILS_ROOT
    elsif defined?(Rails)
      Rails.root.to_s
    end
  end

  def self.rails?
    !rails_root.nil?
  end

end
