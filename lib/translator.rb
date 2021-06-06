# require modules here

require 'pry'

require 'yaml'

def load_library(path)
  library = YAML.load_file(path)
  hash = Hash.new
  library.each{ |key, value|
    hash[key] = {:english => value[0], :japanese => value[1]}
  }
  hash
end

def get_japanese_emoticon(path, english_emoticon)
  library = load_library(path)
  library.each{ |key, value|
    if value[:english] == english_emoticon
        puts value[:japanese]
        return value[:japanese]
    end
  }
  "Sorry, that emoticon was not found"
end

def get_english_meaning (path, japanese_emoticon)
  library = load_library(path)
  #puts library
  library.each{ |key, value|
    if value[:japanese] == japanese_emoticon
        puts key
        return key
    end
  }
  "Sorry, that emoticon was not found"
end
