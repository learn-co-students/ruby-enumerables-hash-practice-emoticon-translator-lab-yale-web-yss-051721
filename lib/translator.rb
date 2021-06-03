# require modules here
require 'yaml'
require 'pry'

def load_library(file)
  hash_of_arrays = YAML.load(File.read(file))
  emoticons_hash = hash_of_arrays.each_with_object({}) do |(name, emoticons), final_hash|
    final_hash[name] = {}
    final_hash[name][:english] = emoticons[0]
    final_hash[name][:japanese] = emoticons[1]
  end
  emoticons_hash
end

def get_japanese_emoticon(file, emoticon)
  hash = load_library(file)
  hash.each do |name, emoticons|
    if emoticons[:english] == emoticon
      return emoticons[:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emoticon)
  hash = load_library(file)
  hash.each do |name, emoticons|
    if emoticons[:japanese] == emoticon
      return name
    end
  end
  return "Sorry, that emoticon was not found"
end