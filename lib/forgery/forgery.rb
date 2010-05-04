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
    self.load_paths << File.expand_path(path)
    Dir["#{self.load_paths.last}/**/*.rb"].uniq.each { |file| require file }
  end

  def self.rails_root
    if defined?(Rails) && Rails.respond_to?(:root)
      Rails.root.to_s
    elsif defined?(RAILS_ROOT)
      RAILS_ROOT
    end
  end

  def self.rails?
    !rails_root.nil?
  end

end
