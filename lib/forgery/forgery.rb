class Forgery

  def self.dictionaries
    @@dictionaries ||= Dictionaries.new
  end

  def self.formats
    @@formats ||= Formats.new
  end

  def self.rails_root
    if defined?(Rails)
      Rails.root.to_s
    elsif defined?(RAILS_ROOT)
      RAILS_ROOT
    end
  end

  def self.rails?
    !rails_root.nil?
  end

end
