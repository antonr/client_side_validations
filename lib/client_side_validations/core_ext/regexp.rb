class Regexp
  def as_json(options = nil)
    string = inspect.sub('\\A', '^').
                     sub('\\Z', '$').
                     sub("\\z", '$').
                     sub(/^\//, '').
                     sub(/\/[a-z]*$/, '').
                     gsub(/\(\?#.+\)/, '').
                     gsub(/\(\?-\w+:/, '(').
                     gsub(/\n/, '')
    flags = self.options & ~Regexp::EXTENDED

    Regexp.new string, flags
  end

  def to_json(options = nil)
    as_json(options).inspect
  end

  def encode_json(encoder)
    inspect
  end
end

